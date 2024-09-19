import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(FilesController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Downloads"),
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.getAllDownloadedFiles(),
        child: Obx(() {
          return ListView.builder(
            itemBuilder: (_, index) {
              var item = controller.files[index];
              return ListTile(
                title: Text(item.path.split('/').last),
                leading: (item.path.endsWith('.png') || item.path.endsWith('.jpg'))
                    ? Image.file(
                        File(item.path),
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      )
                    : null,
              );
            },
            itemCount: controller.files.length,
            physics: AlwaysScrollableScrollPhysics(),
          );
        }),
      ),
    );
  }
}

class FilesController extends GetxController {
  RxList<FileSystemEntity> files = RxList([]);

  Future<void> getAllDownloadedFiles() async {
    var dir = await getTemporaryDirectory();
    var downloads = dir.path + "/downloads";
    if (!Directory(downloads).existsSync()) {
      files.value = [];
      return;
    }
    files.value = Directory(downloads).listSync(recursive: true);
  }
}
