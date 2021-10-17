import 'package:get/route_manager.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/home/home_screen.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/login/login_screen.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/splash/splash_screen.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/core/injector/home_binding.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/core/injector/login_binding.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/core/injector/splash_binding.dart';

class Routes {
  static final String splash = '/splash';
  static final String login = '/login';
  static final String home = '/home';
}

class UCommerceScrens {
  static final screns = [
    GetPage(
        name: Routes.splash,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.login, page: () => LoginScreen(), binding: LoginBinding()),
    GetPage(
        name: Routes.home, page: () => HomeScreen(), binding: HomeBinding()),
  ];
}
