// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/instance_manager.dart';
// import 'package:get/state_manager.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ecommerce_project_api/get/images_getx_controller.dart';
// import 'package:ecommerce_project_api/models/api_response.dart';
// import 'package:ecommerce_project_api/utlis/helpers.dart';
//
// class ImagesScreen extends StatefulWidget {
//   const ImagesScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ImagesScreen> createState() => _ImagesScreenState();
// }
//
// class _ImagesScreenState extends State<ImagesScreen> with Helpers{
//   ImagesGetxController controller =
//       Get.put<ImagesGetxController>(ImagesGetxController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Images'),
//         actions: [
//           IconButton(
//             // onPressed: () =>
//                 Navigator.pushNamed(context, '/upload_image_screen'),
//             icon: const Icon(Icons.upload),
//           ),
//         ],
//       ),
//       body: GetX<ImagesGetxController>(
//         // init: ImagesGetxController(),
//         // global: true,
//         builder: (ImagesGetxController controller) {
//           if (controller.loading.isTrue) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (controller.images.isNotEmpty) {
//             return GridView.builder(
//               itemCount: controller.images.length,
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//               ),
//               itemBuilder: (context, index) {
//                 return Card(
//                   clipBehavior: Clip.antiAlias,
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Stack(
//                     fit: StackFit.expand,
//                     children: [
//                       Image.network(
//                         controller.images[index].imageUrl,
//                         fit: BoxFit.cover,
//                         // width: 50,
//                         // height: 30,
//                       ),
//                       Align(
//                         alignment: AlignmentDirectional.bottomEnd,
//                         child: Container(
//                           height: 50,
//                           width: double.infinity,
//                           color: Colors.black45,
//                           padding: EdgeInsets.symmetric(horizontal: 10),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   controller.images[index].image,
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: GoogleFonts.montserrat(
//                                   ),
//                                 ),
//                               ),
//                               IconButton(
//                                 onPressed: () async => _deleteImage(index: index),
//                                 icon: const Icon(
//                                   Icons.delete,
//                                   color: Colors.red,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             );
//           } else {
//             return Center(
//               child: Text(
//                 'No Data',
//                 style: GoogleFonts.montserrat(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   Future<void> _deleteImage({required int index}) async {
//     ApiResponse apiResponse = await ImagesGetxController.to.deleteImage(index: index);
//     showSnackBar(context, message: apiResponse.message,error: !apiResponse.success);
//   }
// }
