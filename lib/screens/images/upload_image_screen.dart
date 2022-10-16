// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:ecommerce_project_api/get/images_getx_controller.dart';
// import 'package:ecommerce_project_api/models/api_response.dart';
// import 'package:ecommerce_project_api/models/student_image.dart';
// import 'package:ecommerce_project_api/utlis/helpers.dart';
//
// class UploadImageScreen extends StatefulWidget {
//   const UploadImageScreen({Key? key}) : super(key: key);
//
//   @override
//   State<UploadImageScreen> createState() => _UploadImageScreenState();
// }
//
// class _UploadImageScreenState extends State<UploadImageScreen> with Helpers {
//   XFile? _pickedImage;
//   double? _progressValue = 0;
//   late ImagePicker _imagePicker;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _imagePicker = ImagePicker();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Upload Image'),
//         actions: [
//           IconButton(
//             onPressed: () async => await _pickImage(),
//             icon: const Icon(Icons.camera_alt),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           LinearProgressIndicator(
//             minHeight: 10,
//             backgroundColor: Colors.green.shade200,
//             color: Colors.green.shade700,
//             value: _progressValue,
//           ),
//           Expanded(
//             child: _pickedImage != null
//                 ? Image.file(File(_pickedImage!.path))
//                 : IconButton(
//                     onPressed: () async => await _pickImage(),
//                     icon: const Icon(Icons.camera_alt),
//                     iconSize: 70,
//                     color: Colors.grey,
//                   ),
//           ),
//           ElevatedButton.icon(
//             onPressed: () async => await _performUpload(),
//             icon: const Icon(Icons.cloud_upload),
//             label: const Text('UPLOAD'),
//             style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(double.infinity, 50)),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> _pickImage() async {
//     XFile? imageFile = await _imagePicker.pickImage(
//         source: ImageSource.camera, imageQuality: 80);
//     if (imageFile != null) {
//       setState(() => _pickedImage = imageFile);
//     }
//   }
//
//   Future<void> _performUpload() async {
//     if (_checkData()) {
//       await _uploadImage();
//     }
//   }
//
//   bool _checkData() {
//     if (_pickedImage != null) {
//       return true;
//     }
//     showSnackBar(context, message: 'Pick image to upload', error: true);
//     return false;
//   }
//
//   Future<void> _uploadImage() async {
//     setProgress();
//     ApiResponse<StudentImage> apiResponse = await ImagesGetxController.to.upload(path: _pickedImage!.path);
//     print(apiResponse.success);
//     print(apiResponse.message);
//     setProgress(value: apiResponse.success ? 1 : 0);
//     showSnackBar(context, message: apiResponse.message, error: !apiResponse.success);
//   }
//
//   setProgress({double? value}) {
//     setState(() => _progressValue = value);
//   }
// }
