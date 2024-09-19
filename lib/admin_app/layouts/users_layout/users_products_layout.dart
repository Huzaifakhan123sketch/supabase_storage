import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_storage/admin_app/layouts/users_layout/user_product_details_layout.dart';

class UsersProductsLayout extends StatelessWidget {
  const UsersProductsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imgs = [
      "assets/images/headphone.png",
      "assets/images/watch.png",
      "assets/images/face.png",
      "assets/images/cap.png",
      "assets/images/watch.png",
      "assets/images/face.png",
      "assets/images/cap.png",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Products",
          style: TextStyle(
            fontSize: 18.sp,
            color: Color(0xff000000),
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: imgs.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Get.to(()=> UserProductDetailsLayout());
                    },
                    child: Card(
                      elevation: 0,
                      color: Color(0xffDBDBDB),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: Container(
                          height: Get.height * .2,
                          width: Get.width * .3,
                          child: Center(
                            child: Image.asset(
                              imgs[index],
                            ),
                          ),
                        ),
                        title: Text(
                          "Olay 2-In-1 Hydration Balancing Purifying",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Olay Face wash",
                              style: TextStyle(
                                fontSize: 9.sp,
                                color: Color(0xff909090),
                                fontWeight: FontWeight.w500,
                              ),
                            ),Text(
                              "\$ 460",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
