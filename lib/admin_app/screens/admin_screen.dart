import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_storage/admin_app/admin_controller/admin_screen_controller.dart';

import '../layouts/admin_screen_layouts/admin_layout.dart';
import '../layouts/users_layout/all_users_layout.dart';

class AdminScreen extends StatelessWidget {
   AdminScreen({Key? key}) : super(key: key);
  List screens= [
    AdminLayout(),
    AllUsersLayout(),
  ];
  @override
  Widget build(BuildContext context) {
    var controller= Get.put(AdminScreenController());
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
