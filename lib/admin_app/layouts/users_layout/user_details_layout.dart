import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_storage/admin_app/layouts/users_layout/users_products_layout.dart';

class UserDetailsLayout extends StatelessWidget {
  const UserDetailsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        title: Text("Person name Orders"),
        centerTitle: true,
      ),
      body:ListView.builder(
        itemCount: 9,
        itemBuilder: (context, index){
          return  GestureDetector(
            onTap: (){
              Get.to(()=> UsersProductsLayout());
            },
            child: Card(
              color: Colors.grey[200],
              elevation: 0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xffFFFFFF),
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                title: Text("Order #146867686798709800280"),
                subtitle: Text("Tracking #DXBPK00000000145767"),
                trailing: Text("Qty: ${index + 4}",
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },),
    );
  }
}
