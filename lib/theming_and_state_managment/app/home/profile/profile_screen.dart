import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/home/home_controller.dart';
//import 'package:u_commerce_prototype/theming_and_state_managment/app/home/profile/profile_controller.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/theme.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final user = controller.user!.value;
      return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Mi Perfil',
            ),
          ),
        ),
        body: user.image != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: DeliveryColors.green),
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              radius: 55,
                              backgroundImage: AssetImage(user.image!),
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        user.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor),
                      )
                    ],
                  )),
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Card(
                              color: Theme.of(context).canvasColor,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text('Información Personal',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).accentColor),
                                        textAlign: TextAlign.center),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      user.email,
                                    ),
                                    Row(
                                      children: [
                                        const Text('Modo Oscuro',
                                            style: TextStyle(fontSize: 14)),
                                        const Spacer(),
                                        Switch(value: true, onChanged: (val) {})
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Center(
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Text(
                                'Modo Vendedor',
                                style: TextStyle(color: DeliveryColors.white),
                              ),
                            ),
                            onPressed: () {},
                            color: DeliveryColors.purple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ))
                        ],
                      ))
                ],
              )
            : const SizedBox.shrink(),
      );
    });
  }
}
