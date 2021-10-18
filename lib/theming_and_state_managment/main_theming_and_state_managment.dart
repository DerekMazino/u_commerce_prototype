import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/theme.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/core/injector/main_binding.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/core/routes/routes_navigation.dart';

class MainThemingAndStateManagmentScreen extends StatelessWidget {
  const MainThemingAndStateManagmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: Routes.splash,
      getPages: UCommerceScrens.screns,
      initialBinding: MainBinding(),
    );
  }
}
