import 'package:u_commerce_prototype/theming_and_state_managment/domain/model/user.dart';

abstract class LocalStorageRepository {
  Future<String?> getToken();

  Future<void> clearAllData();

  Future<String> saveToken(String token);

  Future<User> getUser();

  Future<User> saveUser(User user);

  Future<void> saveDarkMode(bool darkMode);

  Future<bool?> isDarkMode();
}
