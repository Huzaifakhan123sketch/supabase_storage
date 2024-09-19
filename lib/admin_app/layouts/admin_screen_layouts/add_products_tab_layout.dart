import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_storage/utils/my_snack_bar.dart';

import '../../../utils/supabase_client.dart';

class AddProductsTabLayout extends StatelessWidget {
  const AddProductsTabLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var priceController = TextEditingController();
    var descController = TextEditingController();
    var nameController = TextEditingController();
    var loading = false.obs;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Products",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w500,
                ),
              ).paddingSymmetric(vertical: 5.sp),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.sp),
                    height: Get.height * .045,
                    width: Get.width * .6,
                    child: TextFormField(
                      controller: priceController,
                      decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          hintText: "Price here",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.sp),
                            borderSide: BorderSide(
                              color: Color(0xff000000),
                              width: 1.2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.sp),
                            borderSide: BorderSide(
                              color: Color(0xff000000),
                              width: 1.2,
                            ),
                          )),
                    ),
                  ),
                ],
              ).paddingSymmetric(vertical: 5.sp),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Product Name",
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.sp),
                    height: Get.height * .045,
                    width: Get.width * .6,
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          hintText: "Name...",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.sp),
                            borderSide: BorderSide(
                              color: Color(0xff000000),
                              width: 1.2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.sp),
                            borderSide: BorderSide(
                              color: Color(0xff000000),
                              width: 1.2,
                            ),
                          )),
                    ),
                  ),
                ],
              ).paddingSymmetric(vertical: 5.sp),
              Text(
                "Upload Image",
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                ),
              ).paddingOnly(top: 5.sp),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.sp),
                width: Get.width * .6,
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      suffixIcon: Icon(Icons.drive_folder_upload_sharp),
                      hintText: " 460",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.sp),
                        borderSide: BorderSide(
                          color: Color(0xff000000),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.sp),
                        borderSide: BorderSide(
                          color: Color(0xff000000),
                          width: 1,
                        ),
                      )),
                ),
              ).paddingOnly(bottom: 15.sp),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.sp),
                width: Get.width * .6,
                child: TextFormField(
                  controller: descController,
                  maxLines: 3,
                  decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      hintText: "Description",
                      hintStyle: TextStyle(
                        fontSize: 7.sp,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.sp),
                        borderSide: BorderSide(
                          color: Color(0xff000000),
                          width: 1.2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.sp),
                        borderSide: BorderSide(
                          color: Color(0xff000000),
                          width: 1.2,
                        ),
                      )),
                ),
              ).paddingOnly(bottom: 15.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(() {
                    return ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff000000),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                      ),
                      onPressed: loading.value
                          ? null
                          : () async {
                        var price = priceController.text;
                        var desc = descController.text;
                        var name = nameController.text.trim();
                        loading.value = true;
                        await supabase.from("products").insert(
                          {
                            "name": name,
                            'price': price,
                            "description": desc,
                          },
                        );
                        loading.value = false;
                        showMySnackBar(context, "Product Successfully added");
                      },
                      icon: Text(
                        loading.value ? "Adding..." : "Add",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      label: Icon(
                        Icons.add_circle_outline_sharp,
                        color: Colors.white,
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
