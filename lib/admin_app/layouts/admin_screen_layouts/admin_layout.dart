import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_storage/admin_app/layouts/admin_screen_layouts/add_products_tab_layout.dart';
import 'package:supabase_storage/admin_app/layouts/admin_screen_layouts/products_tab_layout.dart';

class AdminLayout extends StatelessWidget {
  const AdminLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                  color: Color(0xffD8E0E7),
                  borderRadius: BorderRadius.circular(30)),
              child: TabBar(
                indicatorPadding: EdgeInsets.all(8),
                dividerColor: Colors.transparent,
                labelColor: Color(0xff000000),
                unselectedLabelColor: Color(0xff555555),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                ),
                tabs: [
                  Tab(
                    text: 'Add Product',
                  ),
                  Tab(
                    text: 'Products',
                  ),
                ],
              ),
            ).paddingOnly(top: Get.height* .06.sp),
            Expanded(
              child: TabBarView(
                children: [
                  AddProductsTabLayout(),
                  ProductsTabLayout(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
