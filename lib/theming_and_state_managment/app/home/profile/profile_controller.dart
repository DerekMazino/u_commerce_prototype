import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/model/user.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/repositories/local_storage_repository.dart';

class ProfileController extends GetxController {
  final LocalStorageRepository localStorageRepository;

  ProfileController({required this.localStorageRepository});
  Rx<User>? user = User.empty().obs;
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
