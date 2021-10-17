import 'package:shared_preferences/shared_preferences.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/model/user.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/repositories/local_storage_repository.dart';

const _pref_token = 'TOKEN';
const _pref_username = 'USERNAME';
const _pref_name = 'NAME';
const _pref_image = 'IMAGE';
const _pref_dark_theme = 'DARKTHEME';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  @override
  Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_pref_token);
  }

  @override
  Future<User> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final usernName = sharedPreferences.getString(_pref_username);
    final name = sharedPreferences.getString(_pref_name);
    final image = sharedPreferences.getString(_pref_image);
    final user = User(name: name!, email: usernName!, image: image);
    return user;
  }

  @override
  Future<String> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_token, token);
    return token;
  }

  @override
  Future<User> saveUser(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_name, user.name);
    sharedPreferences.setString(_pref_username, user.email);
    sharedPreferences.setString(_pref_image, user.image!);
    return user;
  }

  @override
  Future<void> saveDarkMode(bool darkMode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(_pref_dark_theme, darkMode);
  }

  @override
  Future<bool?> isDarkMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_pref_dark_theme);
  }
}
