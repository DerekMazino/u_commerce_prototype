import 'package:get/instance_manager.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/data/datasourses/local_storage_repository_impl.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/data/datasourses/user_repository_impl.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/repositories/local_storage_repository.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/repositories/user_repository.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalStorageRepository>(() => LocalStorageRepositoryImpl());
    Get.lazyPut<UserRepositoy>(() => UserRepositoryImpl());
  }
}
