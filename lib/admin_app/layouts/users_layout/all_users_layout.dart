import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_storage/admin_app/layouts/users_layout/user_details_layout.dart';

class AllUsersLayout extends StatelessWidget {
  const AllUsersLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List names = [
      "Julia khan",
      "Rida sarra",
      "Suleman Ahmed",
      "Muhammad Moiz",
      "Nimra Niaz",
      "Fitima Sheikh",
      "Nevel Martin",
    ];
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        title: Text("Users"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => UserDetailsLayout());
            },
            child: Card(
              elevation: 0,
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          child: Center(
                            child: Image.asset("assets/images/cap.png"),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            names[index],
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      " User",
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      " Join",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                      child: Text(
                          DateFormat('d MMM yyyy').format(DateTime.now()))),
                ],
              ).paddingSymmetric(horizontal: 6.sp, vertical: 8.sp),
            ).paddingSymmetric(horizontal: 5.sp, vertical: 2.sp),
          );
        },
      ),
    );
  }
}
