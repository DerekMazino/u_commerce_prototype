import 'package:flutter/material.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/splash/splash_screen.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/theme.dart';

class MainThemingAndStateManagmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: lightTheme,
    );
  }
}
