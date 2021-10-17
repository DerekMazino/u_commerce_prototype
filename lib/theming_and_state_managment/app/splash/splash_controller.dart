import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/core/routes/routes_navigation.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/repositories/local_storage_repository.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/repositories/user_repository.dart';

class SplashController extends GetxController {
  final LocalStorageRepository localStorageRepository;
  final UserRepositoy userRepositoy;

  SplashController(
      {required this.localStorageRepository, required this.userRepositoy});

  @override
  void onReady() {
    validateSesion();
    super.onReady();
  }

  void validateSesion() async {
    final token = await localStorageRepository.getToken();
    if (token != null) {
      final user = await userRepositoy.getUserFromToken(token);
      await localStorageRepository.saveUser(user!);
      Get.offNamed(Routes.home);
    } else {
      Get.offNamed(Routes.login);
    }
  }
}
