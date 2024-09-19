import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_storage/controllers/cart_controller.dart';
import 'package:supabase_storage/controllers/home_Tabbar_controller.dart';
import 'package:supabase_storage/layouts/home_layout.dart';

import '../layouts/orders_layout.dart';
import '../layouts/layout/shopping_layout.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List screens = [
    HomeLayout(),
    ShoppingLayout(),
    OrdersLayout(),
  ];

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeTabbarController());
    var cartController = Get.put(CartController());
    return Scaffold(
      body: Obx(
            () => screens.elementAt(controller.selectedIndex.value),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
            selectedItemColor: Color(0xff868686),
            unselectedItemColor: Color(0xff868686),
            unselectedLabelStyle: TextStyle(
              color: Colors.transparent,
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
            selectedLabelStyle: TextStyle(
                color: Color(0xffFF6B00),
                fontWeight: FontWeight.w900,
                fontSize: 20),
            currentIndex: controller.selectedIndex.value,
            onTap: (value) {
              controller.selectedIndex.value = value;
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Obx(() {
                  return Badge(
                    label: Text(cartController.cartProducts.length.toString()),
                    isLabelVisible: cartController.cartProducts.isNotEmpty,
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 30,
                    ),
                  );
                }),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                label: '',
              ),
            ]);
      }),
    );
  }
}
