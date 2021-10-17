import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/splash/splash_controller.dart';

import 'package:u_commerce_prototype/theming_and_state_managment/app/theme.dart';

class SplashScreen extends GetWidget<SplashController> {
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
