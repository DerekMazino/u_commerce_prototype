import 'package:u_commerce_prototype/theming_and_state_managment/core/error/auth_exception.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/model/user.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/repositories/user_repository.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/response/login_response.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/request/login_request.dart';

class UserRepositoryImpl extends UserRepositoy {
  @override
  Future<User?> getUserFromToken(String token) async {
    await Future.delayed(const Duration(seconds: 3));
    if (token == 'AA111') {
      return User(
          name: 'Camilo Marín',
          email: 'juancmaringcu@gmail.com',
          image: 'assets/profile.png');
    } else if (token == 'AA222') {
      return User(
          name: 'Deyci Toloza',
          email: 'deyci09@gmail.com',
          image: 'assets/profile.png');
    }
    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    await Future.delayed(const Duration(seconds: 3));
    if (loginRequest.username == 'juancmaringcu@gmail.com' &&
        loginRequest.password == '123456a') {
      return LoginResponse(
          'AA111',
          User(
              name: 'Camilo Marín',
              email: 'juancmaringcu@gmail.com',
              image: 'assets/profile.png'));
    } else if (loginRequest.username == 'deyci09@gmail.com' &&
        loginRequest.password == '123456a') {
      return LoginResponse(
          'AA222',
          User(
              name: 'Deyci Toloza',
              email: 'deyci09@gmail.com',
              image: 'assets/profile.png'));
    }
    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    print('Remove token for server');
    return;
  }
}
