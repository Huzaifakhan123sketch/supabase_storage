import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_storage/admin_app/layouts/admin_screen_layouts/see_product.dart';
import 'package:supabase_storage/controllers/admin_home_controller.dart';

class ProductsTabLayout extends StatelessWidget {
  const ProductsTabLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AdminHomeController());
    List<String> imgs = [
      "assets/images/headphone.png",
      "assets/images/face.png",
      "assets/images/watch.png",
      "assets/images/cap.png",
      "assets/images/headphone.png",
      "assets/images/watch.png",
      "assets/images/face.png",
      "assets/images/cap.png",
    ];
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => controller.getAddProducts(),
        child: Obx(() {
         return GridView.builder(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            itemCount:controller.addProducts.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: Get.height * .3,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              var item = controller.addProducts[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => SeeProduct(data: item,));
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
                    Text(item['name'],
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      ),
                    ).paddingSymmetric(horizontal: 5.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['price'],
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        RatingStars(
                          valueLabelVisibility: false,
                          value: 5,
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
          // return ListView.builder(
          //   physics: AlwaysScrollableScrollPhysics(),
          //   itemCount: controller.addProducts.length,
          //   shrinkWrap: true,
          //   itemBuilder: (context, index) {
          //
          //
          //   },
          // );
        }),
      ),
    );
  }
}
