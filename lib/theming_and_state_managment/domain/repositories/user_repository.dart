import 'package:u_commerce_prototype/theming_and_state_managment/domain/model/user.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/request/login_request.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/response/login_response.dart';

abstract class UserRepositoy {
  Future<User?> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<void> logout(String token);
}
