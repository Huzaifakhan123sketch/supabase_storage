import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_storage/controllers/cart_controller.dart';
import 'package:supabase_storage/utils/elevated_btn.dart';

class AddToCartLayout extends StatelessWidget {
  Map<String, dynamic> data;

  AddToCartLayout({required this.data});

  @override
  Widget build(BuildContext context) {
    var loading = false.obs;
    var quantityController = TextEditingController();
    var controller = Get.put(CartController());
    var qty = 0.obs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Color(0xffFF6B00),
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.sp, vertical: 10.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['description'],
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
                                "\$ " + data['price'].toString(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w500,
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
                          ).paddingSymmetric(horizontal: 5.sp, vertical: 12.sp),
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
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.sp),
                                    height: Get.height * .035,
                                    width: Get.width * .3,
                                    child: Obx(
                                      () {
                                        return TextFormField(
                                          controller: quantityController,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 0,
                                                    horizontal: 10),
                                            hintText: qty.value.toString(),
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
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      qty.value++;
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
                                  Obx(() {
                                    return Text(qty.value.toString());
                                  }).paddingSymmetric(horizontal: 5.sp),
                                  GestureDetector(
                                    onTap: () {
                                      if (qty.value < 1) {
                                        qty.value = 0;
                                      } else {
                                        qty.value--;
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
                          ).paddingSymmetric(horizontal: 5.sp, vertical: 15.sp),
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
              var alreadyAdded = controller.cartProducts
                  .where((e) => e['product']['id'] == data['id'])
                  .isNotEmpty;

              return ElevatedBtn(
                loading: loading.value,
                onPressed: alreadyAdded
                    ? null
                    : () async {
                        loading.value = true;
                        controller.addToCart(data, qty.value);
                        loading.value = false;
                        Get.back();
                      },
                text: alreadyAdded ? "Added" : "Add to cart",
              );
            },
          ).paddingOnly(bottom: 20.sp),
        ],
      ),
    );
  }
}
