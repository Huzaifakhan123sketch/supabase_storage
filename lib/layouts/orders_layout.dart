import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrdersLayout extends StatelessWidget {
  const OrdersLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        title: Text("Orders"),
        centerTitle: true,
      ),
      body:ListView.builder(
        itemCount: 9,
        itemBuilder: (context, index){
        return  Card(
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
        );
      },),
    );
  }
}
