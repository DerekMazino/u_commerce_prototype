import 'package:u_commerce_prototype/theming_and_state_managment/domain/model/user.dart';

class LoginResponse {
  final String token;
  final User user;

  LoginResponse(this.token, this.user);
}
