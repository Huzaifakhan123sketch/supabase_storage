import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ItemsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var price = 0.obs;
    List<String> imgs = [
      "assets/images/headphone.png",
      "assets/images/face.png",
      "assets/images/cap.png",
      "assets/images/watch.png",
      "assets/images/face.png",
      "assets/images/cap.png",
    ];
    return Card(
      elevation: 0,
      color: Color(0xffDBDBDB),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: Container(
          height: Get.height * .2,
          width: Get.width * .3,
          child: Center(
            child: Image.asset(
              "assets/images/watch.png",
            ),
          ),
        ),
        title: Text(
          "Quantity",
          style: TextStyle(
            fontSize: 12.sp,
            color: Color(0xff000000),
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          "\$ 460",
          style: TextStyle(
            fontSize: 12.sp,
            color: Color(0xff000000),
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                price.value++;
              },
              child: Container(
                height: Get.height * .03,
                width: Get.width * .06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.sp),
                  color: Colors.grey[500],
                ),
                child: Icon(
                  Icons.add,
                  size: 13.sp,
                ),
              ),
            ),
            Obx(() {
              return Text(
                price.value.toString(),
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w500,
                ),
              );
            }).paddingSymmetric(horizontal: 5.sp),
            GestureDetector(
              onTap: () {
                if (price.value < 1) {
                  price.value = 0;
                } else {
                  price.value--;
                }
              },
              child: Container(
                height: Get.height * .03,
                width: Get.width * .06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.sp),
                  color: Colors.grey[500],
                ),
                child: Icon(
                  Icons.remove,
                  size: 13.sp,
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 8.sp),
      ),
    );
  }
}
