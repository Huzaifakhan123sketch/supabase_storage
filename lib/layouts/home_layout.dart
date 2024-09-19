import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_storage/controllers/admin_home_controller.dart';
import 'package:supabase_storage/layouts/add_to_cart_layout.dart';

import '../admin_app/screens/admin_screen.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AdminHomeController());
    List<String> imgs = [
      "assets/images/headphone.png",
      "assets/images/watch.png",
      "assets/images/face.png",
      "assets/images/cap.png",
    ];
    // List<String> names = [
    //   "Bluetooth Headphones",
    //   "Smart Watch",
    //   "Bluetooth Headphones",
    //   "Smart Watch",
    // ];

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => controller.getAddProducts(),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: Get.width * .8,
                        child: Card(
                          elevation: 2,
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              prefixIcon: Icon(Icons.search),
                              hintText: "Search",
                              hintStyle: TextStyle(
                                color: Color(0xff000000).withOpacity(.4),
                              ),
                              filled: true,
                              fillColor: Color(0xffF1EFEF),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.to(() => AdminScreen());
                          },
                          icon: Icon(Icons.person)),
                    ],
                  ),
                  Text(
                    'Best Sellings',
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000),
                    ),
                  ).paddingSymmetric(horizontal: 3.sp),
                  Obx(
                    () {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.addProducts.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: Get.height * .3,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                        ),
                        itemBuilder: (context, index) {
                          var items = controller.addProducts[index];
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => AddToCartLayout(
                                    data: items,
                                  ));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Card(
                                  color: Color(0xffD9D9D9),
                                  elevation: 3,
                                  child: Container(
                                    height: Get.height * .195,
                                    child: Center(
                                      child: Container(
                                        height: Get.height * .15,
                                        child: Image.asset(imgs[index]),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  items['name'],
                                  style: TextStyle(
                                    fontSize: 9.sp,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ).paddingSymmetric(horizontal: 5.sp),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      items['price'].toString(),
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Color(0xff000000),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    RatingStars(
                                      valueLabelVisibility: false,
                                      value: 5,
                                      // maxValue: 5,
                                      starColor: Color(0xffFF6B00),
                                      starSize: 10,
                                    ),
                                  ],
                                ).paddingSymmetric(horizontal: 5.sp)
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
