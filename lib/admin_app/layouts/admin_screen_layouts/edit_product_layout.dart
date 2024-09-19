import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_storage/utils/elevated_btn.dart';
import 'package:supabase_storage/utils/my_snack_bar.dart';
import 'package:supabase_storage/utils/supabase_client.dart';

class EditProductLayout extends StatelessWidget {
  Map<String, dynamic> edit;

  EditProductLayout({required this.edit});

  @override
  Widget build(BuildContext context) {
    var priceController = TextEditingController(text: edit['price']);
    var nameController = TextEditingController(text: edit['name']);
    var descController = TextEditingController(text: edit['description']);
    var loading = false.obs;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Products",
          style: TextStyle(
            fontSize: 20.sp,
            color: Color(0xff000000),
            fontWeight: FontWeight.w500,
          ),
        ).paddingSymmetric(vertical: 5.sp),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500,
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
                          hintText: "Price...",
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
                      fontWeight: FontWeight.w500,
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
                          hintText: "\$ 460",
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
                  fontWeight: FontWeight.w500,
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
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.sp),
                width: Get.width * .6,
                child: TextFormField(
                  maxLines: 3,
                  controller: descController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    hintText: "description",
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
                    ),
                  ),
                ),
              ).paddingOnly(bottom: 15.sp),
              Obx(
                () {
                  return ElevatedBtn(
                      loading: loading.value,
                      onPressed: () async {
                        var name = nameController.text.trim();
                        var price = priceController.text;
                        var desc = descController.text;
                        loading.value = true;
                        await supabase.from("products").update(
                          {
                            "name": name,
                            "price": price,
                            "description": desc,
                          },
                        ).eq('id', edit['id']);
                        loading.value = false;
                        showMySnackBar(context, "Product Edited Success");
                        Navigator.pop(context);
                      },
                      text: "Update");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
