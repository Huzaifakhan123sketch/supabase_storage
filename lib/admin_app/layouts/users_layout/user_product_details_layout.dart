import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UserProductDetailsLayout extends StatelessWidget {
  const UserProductDetailsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            height: Get.height * .3,
            child: Center(child: Image.asset("assets/images/cap.png")),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "NY Baseball Cap for Men black \n+ waterproof and save from high \nsunlight",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w500,
                      ),
                    ).paddingSymmetric(horizontal: 5.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ 460",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        RatingStars(
                          valueLabelVisibility: false,
                          value: 3,
                          starOffColor: Colors.grey.shade400,
                          starColor: Color(0xffFF6B00),
                          starSize: 12.sp,
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 5.sp),
                    Text(
                      "Family Colours",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600,
                      ),
                    ).paddingSymmetric(horizontal: 5.sp, vertical: 10.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Quantity",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Color(0xffFFFFFF),
                                  minimumSize:
                                  Size(Get.width * .25, Get.height * .035),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.sp),
                                  ),
                                  side: BorderSide(
                                      color: Color(0xff000000), width: 1.2)),
                              onPressed: () {},
                              child: Text("2"),
                            ).paddingSymmetric(horizontal: 10.sp),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
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
                            Text("2").paddingSymmetric(horizontal: 5.sp),
                            Container(
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
                          ],
                        )
                      ],
                    ).paddingSymmetric(horizontal: 5.sp),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xff000000),
        onPressed: () {},
        label: Text(
          "Delete",
          style: TextStyle(
            fontSize: 12.sp,
            color: Color(0xffFFFFFF),
            fontWeight: FontWeight.w500,
          ),
        ).paddingSymmetric(horizontal: 10.sp),
      ),
    );
  }
}
