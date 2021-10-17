import 'package:get/instance_manager.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
        localStorageRepository: Get.find(), userRepositoy: Get.find()));
  }
}
