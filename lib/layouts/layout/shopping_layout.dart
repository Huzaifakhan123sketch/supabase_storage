import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_storage/layouts/layout/items_layout.dart';

import '../order_success_layout.dart';

class ShoppingLayout extends StatelessWidget {
  const ShoppingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:5,
                      itemBuilder: (context, index) {
                        return ItemsLayout();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Total : ",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w500,
                      ),
                    ).paddingSymmetric(horizontal: 5.sp),
                    Text(
                      "\$ 760 ",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w500,
                      ),
                    ).paddingSymmetric(horizontal: 5.sp),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff000000),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.sp),
                      )),
                  onPressed: () {
                    Get.to(() => OrderSuccessLayout());
                  },
                  child: Text(
                    "Check Out",
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 5.sp, vertical: 5.sp),
          ],
        ),
      ),
    );
  }
}
