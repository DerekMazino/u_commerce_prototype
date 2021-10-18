import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/home/cart/cart_controller.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/home/home_controller.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/home/products/products_controller.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/theme.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/widgets/delivery_button.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/data/in_memory_products.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/model/product.dart';

class ProductsScreen extends StatelessWidget {
  final controller = Get.find<HomeController>();
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Inicio',
          ),
        ),
      ),
      body: Obx(
        () => controller.productList.isNotEmpty
            ? GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  final Product product = controller.productList[index];
                  return _ItemProduct(
                      product: product,
                      onTap: () {
                        cartController.add(product);
                      });
                })
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _ItemProduct extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  const _ItemProduct({Key? key, required this.product, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Theme.of(context).canvasColor,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                    ))),
            Expanded(
              child: Column(
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.description,
                    style: Theme.of(context)
                        .textTheme
                        .overline!
                        .copyWith(color: DeliveryColors.lightGrey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$${product.price}',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ],
              ),
            ),
            DeliveryButton(
                padding: EdgeInsets.symmetric(vertical: 4),
                text: 'Agregar',
                onTap: onTap)
          ],
        ),
      ),
    );
  }
}
