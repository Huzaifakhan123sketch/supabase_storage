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

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_storage/downloads_screen.dart';

import 'image_controller.dart';

class ImagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ImageController controller = Get.put(ImageController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Supabase Image Upload/Download'),
        actions: [IconButton(onPressed: () {
          Get.to(() => DownloadsScreen());
        }, icon: Icon(Icons.download))],
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.fetchAllImages("test"),
        child: Obx(
          () {
            return ListView.builder(
              itemBuilder: (_, index) {
                var item = controller.allFiles[index];
                return ListTile(
                  title: Text(item.name),
                  leading: item.metadata != null ? Text("${NumberFormat("#.##").format((item.metadata!['size'] as num)/1024)} kb") : null,
                  trailing: IconButton(
                    onPressed: () async {
                      var dir = await getTemporaryDirectory();
                      controller.downloadFile(dir, item, "test").then((_) {
                        log("File downloaded successfully");
                      });
                    },
                    icon: Icon(Icons.download),
                  ),
                );
              },
              itemCount: controller.allFiles.length,
              physics: AlwaysScrollableScrollPhysics(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var image = await ImagePicker().pickImage(source: ImageSource.gallery);
          if (image != null) {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text("Picked file"),
                content: Image.file(
                  File(image.path),
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Dismiss"),
                  ),
                  TextButton(
                    onPressed: () async {
                      await controller.uploadFileToBucket(
                        "test",
                        File(image.path),
                      );
                      Navigator.pop(context);
                    },
                    child: Text("Upload"),
                  ),
                ],
              ),
            );
          }
        },
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
