import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_storage/screens/home_screen.dart';
import '../controllers/auth_controller.dart';
import '../utils/elevated_btn.dart';
import '../utils/my_snack_bar.dart';
import '../utils/supabase_client.dart';
import 'login_layout.dart';

class SignupLayout extends StatelessWidget {
  const SignupLayout({Key? key}) : super(key: key);

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
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Create an account',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff1A1E25)),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff1A1E25)),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Insert your email here",

                      filled: true,
                      // focusColor: Color(0xffF1F1FE),
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
                    height: 10,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff1A1E25)),
                  ),
                  SizedBox(height: 6),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Insert your password here",
                      filled: true,
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
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => LoginLayout());
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(
                    height: Get.height * .15,
                  ),
                  Obx(
                        () {
                      return ElevatedBtn(
                        onPressed: () async{
                          var email = emailController.text;
                          var password = passwordController.text;
                          loading.value = true;
                          var response = await controller.signup(password, email);
                          loading.value = false;
                          if (response == 'success') {
                            if (supabase.auth.currentUser != null) {
                              Get.offAll( HomeScreen());
                            }
                            showMySnackBar(
                                context, "You are successfully signed up");
                          } else {
                            showMySnackBar(context, response);
                          }
                        },
                        loading: loading.value,
                        text: "Signup",
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
