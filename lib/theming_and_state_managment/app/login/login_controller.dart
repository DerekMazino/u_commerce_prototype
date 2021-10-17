import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/login/login_screen.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/core/error/auth_exception.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/repositories/local_storage_repository.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/repositories/user_repository.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/request/login_request.dart';

class LoginController extends GetxController {
  final LocalStorageRepository localStorageRepository;
  final UserRepositoy userRepositoy;

  LoginController(
      {required this.localStorageRepository, required this.userRepositoy});

  final userNameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  var loginState = LoginState.initial.obs;

  Future<bool> login() async {
    final username = userNameTextController.text;
    final password = passwordTextController.text;

    try {
      loginState(LoginState.loading);
      final loginResponse =
          await userRepositoy.login(LoginRequest(username, password));
      await localStorageRepository.saveToken(loginResponse.token);
      await localStorageRepository.saveUser(loginResponse.user);
      return true;
    } on AuthException catch (_) {
      loginState(LoginState.initial);
      return false;
    }
  }
}
