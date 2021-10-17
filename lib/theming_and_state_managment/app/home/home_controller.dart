//import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/model/user.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/repositories/local_storage_repository.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/repositories/user_repository.dart';

class HomeController extends GetxController {
  final LocalStorageRepository localStorageRepository;
  final UserRepositoy userRepositoy;
  HomeController(
      {required this.userRepositoy, required this.localStorageRepository});

  Rx<User>? user = User.empty().obs;
  RxInt indexSelect = 0.obs;
  RxBool isDarkThemeBool = false.obs;

  @override
  void onReady() {
    loadUser();
    loadCurrentTheme();
    super.onReady();
  }

  void loadUser() {
    localStorageRepository.getUser().then((value) {
      user!(value);
    });
  }

  void loadCurrentTheme() {
    localStorageRepository.isDarkMode().then((value) {
      isDarkThemeBool(value);
    });
  }

  bool updateTheme(bool isDark) {
    localStorageRepository.saveDarkMode(isDark);
    isDarkThemeBool(isDark);
    return isDark;
  }

  void updateIndexSelected(int index) {
    indexSelect(index);
  }

  Future<void> logout() async {
    final token = await localStorageRepository.getToken();
    await userRepositoy.logout(token!);
    await localStorageRepository.clearAllData();
  }
}
