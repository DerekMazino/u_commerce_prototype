import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/home/home_screen.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/login/login_Controller.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/theme.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/widgets/delivery_button.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/core/routes/routes_navigation.dart';

const logoSize = 45.0;

enum LoginState { loading, initial }

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  void login() async {
    final result = await controller.login();
    if (result) {
      Get.offAllNamed(Routes.home);
    } else {
      Get.snackbar('Error', 'Login Incorrecto');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final moreSize = 50.0;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Positioned(
                      left: -moreSize / 2,
                      right: -moreSize / 2,
                      height: width + moreSize,
                      bottom: logoSize,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: deliveryGradient,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.4, 1.0]),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(size.width / 2),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).canvasColor,
                        radius: logoSize,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/logoavatar.png',
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Iniciar Sesión',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .inputDecorationTheme
                                        .labelStyle!
                                        .color,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Email',
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: controller.userNameTextController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline,
                                color: Theme.of(context).iconTheme.color),
                            hintText: 'Email',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Password',
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: controller.passwordTextController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock,
                                color: Theme.of(context).iconTheme.color),
                            hintText: '********',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(25),
                  child: DeliveryButton(
                    text: 'Login',
                    onTap: login,
                  ))
            ],
          ),
          Positioned.fill(child: Obx(() {
            if (controller.loginState.value == LoginState.loading) {
              return Container(
                color: Colors.black26,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          }))
        ],
      ),
    );
  }
}
