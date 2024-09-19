import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_storage/image_screen.dart';
import 'package:supabase_storage/screens/home_screen.dart';
import 'package:supabase_storage/utils/supabase_client.dart';

import 'auth/signup_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ivvuhocmvojevqnnoxfc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml2dnVob2Ntdm9qZXZxbm5veGZjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjU4NjYzODgsImV4cCI6MjA0MTQ0MjM4OH0.h_uTD1rOAZ-CFOj-MlmWwyONw82w2kCBkALih6Eh670',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (_, __, ___) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Color(0xffFFFFFF),
              surfaceTintColor: Colors.grey[200]),
          scaffoldBackgroundColor: Colors.grey[100],
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color(0xffFFFFFF),
            elevation: 3,
            type: BottomNavigationBarType.fixed,
          ),
          bottomSheetTheme: BottomSheetThemeData(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: supabase.auth.currentUser == null ? SignupLayout() : HomeScreen(),
        home: ImagesScreen(),
      );
    });
  }
}
