// import 'dart:developer';
// import 'dart:io';
//
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:supabase_storage/utils/supabase_client.dart';
//
// class ImageController extends GetxController {
//   var image = Rx<File?>(null);
//
//   RxString path = ''.obs;
//   RxString url = ''.obs;
//
//   Future<void> galleryPicker() async {
//     try {
//       ImagePicker picker = ImagePicker();
//       final XFile? pickedFile =
//           await picker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         image.value = File(pickedFile.path);
//       }
//     } catch (e) {
//       log("Error picking image: $e");
//     }
//   }
//
//   Future<void> upload() async {
//     try {
//       if (image.value == null) return;
//       var fileName = DateTime.now().millisecondsSinceEpoch.toString();
//       await supabase.storage
//           .from("images")
//           .upload(fileName, image.value!)
//           .then((value) {
//         path.value = value;
//         log(path.value);
//         print("done");
//       });
//     } catch (e) {
//       log("error while fetching data :: $e");
//     }
//   }
//
//   Future<void> download() async {
//     try {
//       var publicUrl =
//           await supabase.storage.from("images").getPublicUrl("$path");
//       url.value = publicUrl;
//     } catch (e) {
//       log("error  is this $e");
//     }
//   }
// }
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_storage/utils/supabase_client.dart';

class ImageController extends GetxController {
  var image = Rx<File?>(null);

  Future<void> uploadImage() async {
    ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    var fileName = DateTime.now().millisecondsSinceEpoch.toString();
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      await supabase.storage
          .from('images')
          .upload(fileName, image.value!)
          .then((value) {
        print("Done");
      });
    }
  }

  Future<void> downloadImage(String fileName) async {
    await supabase.storage.from('images').download(fileName);
  }
}
