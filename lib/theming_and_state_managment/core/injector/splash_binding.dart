import 'package:get/instance_manager.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(
        localStorageRepository: Get.find(), userRepositoy: Get.find()));
  }
}
