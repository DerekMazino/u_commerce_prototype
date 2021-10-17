import 'package:get/instance_manager.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/login/login_Controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(
        localStorageRepository: Get.find(), userRepositoy: Get.find()));
  }
}
