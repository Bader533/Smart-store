import 'package:ecommerce_project_api/database/controller/cart_db_controller.dart';
import 'package:ecommerce_project_api/models/cart.dart';
import 'package:get/get.dart';

enum OperationType { increase, decrease }

class CartGetxController extends GetxController {
  RxList<Cart> cartItem = <Cart>[].obs;
  final CartDbController _controller = CartDbController();
  static CartGetxController get to => Get.find();
  RxBool loading = false.obs;
  RxDouble total = 0.0.obs;

  // static CartGetxController get to => Get.find<CartGetxController>();
  //
  // @override
  // void onInit() {
  //   read();
  //   super.onInit();
  // }
  //
  // Future<ProcessResponse> create({required Cart cart}) async {
  //   int newRowId = await _controller.create(cart);
  //   if (newRowId != 0) {
  //     cart.id = newRowId;
  //     cartItem.add(cart);
  //   }
  //   return ProcessResponse(
  //       message: newRowId != 0 ? 'Created Successfully' : 'Created Failed',
  //       success: newRowId != 0);
  // }
  //
  // void read() async {
  //   loading.value = true;
  //   cartItem.value = await _controller.read();
  //   loading.value = false;
  // }
  //
  // Future<ProcessResponse> updateNote({required Cart updatedCart}) async {
  //   bool updated = await _controller.update(updatedCart);
  //   if (updated) {
  //     int index =
  //         cartItem.indexWhere((element) => element.id == updatedCart.id);
  //     if (index != -1) {
  //       cartItem[index] = updatedCart;
  //     }
  //   }
  //   return ProcessResponse(
  //       message: updated ? 'Updated Successfully' : 'Updated Failed',
  //       success: updated);
  // }
  //
  // Future<ProcessResponse> delete({required int index}) async {
  //   bool deleted = await _controller.delete(cartItem[index].id);
  //   if (deleted) {
  //     cartItem.removeAt(index);
  //   }
  //   return ProcessResponse(
  //       message: deleted ? 'Deleted Successfully' : 'Deleted Failed',
  //       success: deleted);
  // }

  // Future<void> read() async {
  //   // loading.value = true;
  //   cartItem.value = await _controller.read();
  //   // loading.value = false;
  //   print('read data');
  // }

  void read() async {
    loading.value = true;
    cartItem.value = await _controller.read();
    cartItem.forEach((element) {
      total.value += element.totalPrice;
    });
    loading.value = false;
    print('read data');
  }

  Future<void> manageCart(Cart cart) async {
    print(' manageCart :: ${cart.nameEn}');
    int index =
        cartItem.indexWhere((element) => cart.productId == element.productId);
    if (index != -1) {
      Cart currentCartItem = cartItem[index];
      OperationType operationType = cart.quantity < currentCartItem.quantity
          ? OperationType.decrease
          : OperationType.increase;
      // existed -update (increase)
      _update(cart, index, operationType);
    } else {
      //not existed - Add
      _create(cart);
    }
  }

  Future<void> _clear() async {
    _controller.clear(Cart.tableName);
  }

  Future<void> _create(Cart cart) async {
    print('create :: ${cart.nameEn}');
    int newRowId = await _controller.create(cart);
    if (newRowId != 0) {
      cart.id = newRowId;
      cartItem.add(cart);
    }
  }

  Future<void> _update(
      Cart updatedCart, int index, OperationType operationType) async {
    if (operationType == OperationType.increase) {
      updatedCart.quantity += 1;
      total.value += updatedCart.price;
      _updateQuantity(updatedCart, index);
    } else {
      if (updatedCart.quantity > 1) {
        updatedCart.quantity -= 1;
        total.value -= updatedCart.price;
        _updateQuantity(updatedCart, index);
      } else {
        bool deleted = await _delete(updatedCart.id);
        if (deleted) {
          cartItem.removeAt(index);
        }
      }
    }
  }

  Future<void> _updateQuantity(Cart updatedCart, int index) async {
    updatedCart.totalPrice = updatedCart.quantity * updatedCart.price;
    bool updated = await _controller.update(updatedCart);
    if (updated) {
      cartItem[index] = updatedCart;
    }
  }

  Future<bool> _delete(int id) async {
    bool deleted = await _controller.delete(id);
    if (deleted) {
      int index = cartItem.indexWhere((element) => element.id == id);
      if (index != 1) {
        cartItem.removeAt(index);
      }
    }
    return deleted;
  }
}

// هذه الدالة لتجنب التكرار
