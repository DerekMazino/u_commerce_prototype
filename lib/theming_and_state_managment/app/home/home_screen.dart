import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/home/cart/cart_controller.dart';

import 'package:u_commerce_prototype/theming_and_state_managment/app/home/cart/cart_screen.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/home/home_controller.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/home/products/products_screen.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/home/profile/profile_screen.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/theme.dart';

class HomeScreen extends GetWidget<HomeController> {
  //int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Obx(
            () => IndexedStack(
              index: controller.indexSelect.value,
              children: [
                ProductsScreen(),
                const Placeholder(),
                CartScreen(
                  onShoppingg: () {
                    /* setState(() {
                      currentIndex = 0;
                    }); */
                    controller.indexSelect.value = 0;
                  },
                ),
                const Placeholder(),
                ProfileScreen()
              ],
            ),
          )),
          Obx(
            () => _NavigationBar(
                index: controller.indexSelect.value,
                onIndexSelected: (index) {
                  controller.updateIndexSelected(index);
                }),
          )
        ],
      ),
    );
  }
}

class _NavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;
  final controller = Get.find<HomeController>();
  final cartController = Get.find<CartController>();
  _NavigationBar({Key? key, required this.index, required this.onIndexSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).canvasColor,
            border: Border.all(
                color: Theme.of(context).bottomAppBarColor, width: 2)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                child: IconButton(
                  onPressed: () => onIndexSelected(0),
                  icon: Icon(Icons.home),
                  color: index == 0
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
              ),
              Material(
                child: IconButton(
                  onPressed: () => onIndexSelected(1),
                  icon: Icon(Icons.storefront),
                  color: index == 1
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
              ),
              Material(
                child: Stack(
                  children: [
                    CircleAvatar(
                        backgroundColor: DeliveryColors.purple,
                        radius: 23,
                        child: IconButton(
                          onPressed: () => onIndexSelected(2),
                          icon: Icon(Icons.shopping_basket),
                          color: index == 2
                              ? DeliveryColors.green
                              : DeliveryColors.white,
                        )),
                    Positioned(
                        right: 0,
                        child: Obx(
                          () => cartController.totalItems.value == 0
                              ? const SizedBox.shrink()
                              : CircleAvatar(
                                  radius: 10,
                                  backgroundColor: DeliveryColors.pink,
                                  child: Text(cartController.totalItems.value
                                      .toString()),
                                ),
                        ))
                  ],
                ),
              ),
              Material(
                child: IconButton(
                  onPressed: () => onIndexSelected(3),
                  icon: Icon(Icons.favorite_border),
                  color: index == 3
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
              ),
              Material(
                child: InkWell(
                  onTap: () => onIndexSelected(4),
                  child: Obx(() {
                    final user = controller.user!.value;

                    return user.image == null
                        ? const SizedBox.shrink()
                        : CircleAvatar(
                            radius: 13,
                            backgroundImage: AssetImage(
                              user.image!,
                            ),
                          );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
