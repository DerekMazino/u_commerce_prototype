import 'dart:async';

import 'package:flutter/material.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/home/home_screen.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/login/login_screen.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/theme.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => HomeScreen(),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: deliveryGradient,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: DeliveryColors.white,
            radius: 50,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset('assets/logoshop.png'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text('U-Commerce',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.bold, color: DeliveryColors.white)),
        ],
      ),
    ));
  }
}
