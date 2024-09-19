import 'dart:developer';

import 'package:get/get.dart';
import 'package:supabase_storage/utils/supabase_client.dart';

class AdminHomeController extends GetxController {
  Rx<Map<String, dynamic>> user = Rx({});
  RxList<Map<String, dynamic>> addProducts = RxList([]);

  @override
  void onInit() {
    supabase
        .from("users")
        .stream(primaryKey: ["id"])
        .eq("id", supabase.auth.currentUser!.id)
        .listen((value) {
          user.value = value.first;
        });
    getAddProducts();
    super.onInit();
  }

  Future<void> getAddProducts() async {
    await supabase.from("products").select("*").then((data) {
      log(data.toString());
      addProducts.value = data;
    });
  }
}
