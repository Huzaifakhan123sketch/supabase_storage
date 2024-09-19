import 'dart:developer';

import 'package:get/get.dart';
import 'package:supabase_storage/utils/supabase_client.dart';

class CartController extends GetxController {
  RxList<Map<String, dynamic>> cartProducts = RxList([]);

  void createOrder() async {
    List<int> addedProducts = [];
    await Future.forEach(cartProducts, (e) async {
      var product = e['product'];
      var qty = e['qty'];
      var id = product['id'];
      var price = product['price'];
      var insertedProduct = await supabase
          .from("order_products")
          .insert({
            "product_id": id,
            "price": price,
            "qty": qty,
          })
          .select("*")
          .single();
      addedProducts.add(insertedProduct['id']);
    });
    cartProducts.clear();

    await supabase.from("orders").insert({
      "user_id": supabase.auth.currentUser!.id,
      "order_products": addedProducts
    });
  }

  Future<void> getOrderData() async {
    await supabase.from('orders').select("*").then((value) {
      cartProducts.value = value;
      log(value.toString());
    });
  }

  void addToCart(Map<String, dynamic> product, int qty) {
    cartProducts.add({"product": product, "qty": qty, "price": product['price']});
  }
}
