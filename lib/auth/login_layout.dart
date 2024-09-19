import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_storage/auth/signup_layout.dart';

import '../controllers/auth_controller.dart';
import '../screens/home_screen.dart';
import '../utils/elevated_btn.dart';
import '../utils/my_snack_bar.dart';
import '../utils/supabase_client.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var loading = false.obs;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff1A1E25)),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff1A1E25)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: emailController,
                    focusNode: FocusNode(),
                    decoration: InputDecoration(
                      hintText: "Insert your email here",
                      filled: true,
                      focusColor: Color(0xffF1F1FE),
                      fillColor: Color(0xffE3E3E7).withOpacity(0.2),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE3E3E7)),
                        borderRadius: BorderRadius.circular(89),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff3B46F1)),
                        borderRadius: BorderRadius.circular(89),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff1A1E25)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: passwordController,
                    focusNode: FocusNode(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Insert your password here",
                      filled: true,
                      focusColor: Color(0xffF1F1FE),
                      fillColor: Color(0xffE3E3E7).withOpacity(0.2),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE3E3E7)),
                        borderRadius: BorderRadius.circular(89),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff3B46F1),
                        ),
                        borderRadius: BorderRadius.circular(89),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => SignupLayout());
                    },
                    child: Text('Signup'),
                  ),
                  SizedBox(
                    height: Get.height * .15,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Obx(
                      () {
                        return ElevatedBtn(
                          loading: loading.value,
                          onPressed: () async {
                            var email = emailController.text;
                            var password = passwordController.text;
                            loading.value = true;
                            var response =
                                await controller.login(password, email);
                            loading.value = false;
                            if (response == 'success') {
                              Get.offAll(HomeScreen());
                              showMySnackBar(context,
                                  "Logged in successfully as ${supabase.auth.currentUser!.email}");
                            } else {
                              showMySnackBar(context, response);
                            }
                          },
                          text: 'Log in',
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
