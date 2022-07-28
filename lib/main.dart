import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import'screens/check_screen.dart';
import'screens/login_screen.dart';
import'screens/registration_screen.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'The App',
          initialRoute: '/CS',
          routes: {
            '/CS': (context) => const CheckScreen(),
            '/LS': (context) => const LoginScreen(),
            '/RS': (context) => const RegistrationScreen(),
            '/MS': (context) => const MainScreen()
          },
        );
      },
    );
  }
}
