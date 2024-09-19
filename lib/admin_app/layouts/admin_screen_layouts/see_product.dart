import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_storage/admin_app/admin_controller/price_controller.dart';
import 'package:supabase_storage/utils/elevated_btn.dart';
import 'package:supabase_storage/utils/my_snack_bar.dart';
import 'package:supabase_storage/utils/supabase_client.dart';

import 'edit_product_layout.dart';

class SeeProduct extends StatelessWidget {
  Map<String, dynamic> data;

  SeeProduct({required this.data});

  @override
  Widget build(BuildContext context) {
    var priceController = Get.put(PriceController());
    var loading = false.obs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => EditProductLayout(
                    edit: data,
                  ));
            },
            icon: Icon(
              Icons.note_alt_outlined,
              color: Color(0xff555555),
              size: 35,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: Get.height * .3,
                    child: Center(child: Image.asset("assets/images/cap.png")),
                  ),
                  Container(
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
                            data['description'],
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xff505050),
                              fontWeight: FontWeight.w500,
                            ),
                          ).paddingSymmetric(horizontal: 5.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data['price'],
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
                          ).paddingSymmetric(horizontal: 5.sp, vertical: 10.sp),
                          SizedBox(
                            height: Get.height * .05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Quantity",
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Color(0xff000000),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10.sp),
                                    height: Get.height * .035,
                                    width: Get.width * .3,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        hintText: "quantity",
                                        hintStyle: TextStyle(
                                          fontSize: 10.sp,
                                          color: Color(0xff555555),
                                          fontWeight: FontWeight.w400,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.sp),
                                          borderSide: BorderSide(
                                            color: Color(0xff000000),
                                            width: 1,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.sp),
                                          borderSide: BorderSide(
                                            color: Color(0xff000000),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      priceController.price.value++;
                                    },
                                    child: Container(
                                      height: Get.height * .03,
                                      width: Get.width * .06,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.sp),
                                        color: Colors.grey[300],
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: 13.sp,
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () {
                                      return Text(priceController.price.value
                                          .toString());
                                    },
                                  ).paddingSymmetric(horizontal: 5.sp),
                                  GestureDetector(
                                    onTap: () {
                                      if (priceController.price.value < 1) {
                                        priceController.price.value = 0;
                                      } else {
                                        priceController.price.value--;
                                      }
                                    },
                                    child: Container(
                                      height: Get.height * .03,
                                      width: Get.width * .06,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.sp),
                                        color: Colors.grey[300],
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        size: 13.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ).paddingSymmetric(horizontal: 5.sp),
                          SizedBox(
                            height: Get.height * .2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () {
              return ElevatedBtn(
                loading: loading.value,
                onPressed: () async {
                  loading.value = true;
                  await supabase.from("products").delete().eq('id', data['id']);
                  loading.value = false;
                  Navigator.pop(context);
                  showMySnackBar(context, "Your data are deleted Successfully");
                },
                text: "Delete",
              ).paddingSymmetric(horizontal: 5.sp, vertical: 10.sp);
            },
          ),
        ],
      ),
    );
  }
}
