import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ElevatedBtn extends StatelessWidget {
  VoidCallback? onPressed;
  String text;
  bool loading;

  ElevatedBtn({
    required this.onPressed,
    required this.text,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        minimumSize: Size(Get.width * .7, Get.height * .05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        )
      ),
      onPressed: loading ? null : onPressed,
      child: loading
          ? Center(
              child: SizedBox(
                height: 35,
                width: 35,
                child: CircularProgressIndicator(
                  color: Color(0xffFFFFFF),
                ),
              ),
            )
          : Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: Color(0xffFFFFFF),
              ),
            ),
    );
  }
}
