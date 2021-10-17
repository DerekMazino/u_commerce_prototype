//import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/model/user.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/repositories/local_storage_repository.dart';

class HomeController extends GetxController {
  final LocalStorageRepository localStorageRepository;

  HomeController({required this.localStorageRepository});

  Rx<User>? user = User.empty().obs;
  RxInt indexSelect = 0.obs;
  @override
  void onReady() {
    loadUser();
    super.onReady();
  }

  void loadUser() {
    localStorageRepository.getUser().then((value) {
      user!(value);
    });
  }
}
