// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:supabase_storage/image_controller.dart';
//
// class ImageScreen extends StatelessWidget {
//   const ImageScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var imgController = Get.put(ImageController());
//     var loading = false.obs;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.lightBlue,
//         centerTitle: true,
//         title: Text("Image from supabase"),
//       ),
//       body: SingleChildScrollView(
//           child: Center(
//             child: Column(
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     imgController.galleryPicker();
//                   },
//                   child: Text("Pick image from gallery"),
//                 ),
//                 Obx(() {
//                   return Container(
//                     height: 300,
//                     child: imgController.image.value != null
//                         ? Image.file(
//                       imgController.image.value!,
//                       fit: BoxFit.cover,
//                     )
//                         : Text("No image selected"),
//                   );
//                 }),
//                 Obx(() {
//                   return TextButton(
//                     onPressed: () async {
//                       await imgController.upload();
//                     },
//                     child: Text(loading.value ? "Please wait":"Upload"),
//                   );
//                 }),
//                 TextButton(
//                   onPressed: () async {
//                     await imgController.download();
//                   },
//                   child: Text("Download"),
//                 ),
//                 Text(imgController.url.toString()),
//                 Obx(() {
//                   return Container(
//                     child: imgController.url.value == ''
//                         ? Text("no image downloaded")
//                         : Image.network(imgController.url.value),
//                   );
//                 }),
//               ],
//             ),
//           )
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_storage/utils/supabase_client.dart';

import 'image_controller.dart';

class ImagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ImageController controller = Get.put(ImageController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Supabase Image Upload/Download'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() {
              if (controller.image.value != null) {
                return Image.file(
                  File(controller.image.value.toString()),
                );
              } else {
                return Text('No image uploaded');
              }
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => controller.uploadImage(),
              child: Text('Upload Image'),
            ),
            ElevatedButton(
              onPressed: () async {
                await supabase.storage.from('images').download("");
              },
              child: Text('Download Image'),
            ),
          ],
        ),
      ),
    );
  }
}
