import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_storage/screens/home_screen.dart';

class OrderSuccessLayout extends StatelessWidget {
  const OrderSuccessLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: Get.height * .08,
                    backgroundColor: Color(0xff00D455),
                    child: Icon(
                      Icons.done,
                      color: Color(0xffFFFFFF),
                      size: Get.size.height * .1,
                    ),
                  ),
                  Text(
                    "Order success!",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500,
                    ),
                  ).paddingSymmetric(horizontal: 5.sp),
                  Text(
                    "Your order has been placed successfully! \nFor more details, go to my orders. ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Color(0xffBDBDBD),
                      fontWeight: FontWeight.w400,
                    ),
                  ).paddingSymmetric(horizontal: 5.sp),
                ],
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffCF2E2E),
                minimumSize: Size(Get.width *.8, Get.height *.07),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.sp),
                )
            ),
            onPressed: () {
              Get.to(()=> HomeScreen());
            },
            child: Text(
              "Continue Shopping",
              style: TextStyle(
                fontSize: 13.sp,
                color: Color(0xffFFFFFF),
                fontWeight: FontWeight.w500,
              ),
            ),
          ).paddingSymmetric(vertical: 20.sp),
        ],
      ),
    );
  }
}
