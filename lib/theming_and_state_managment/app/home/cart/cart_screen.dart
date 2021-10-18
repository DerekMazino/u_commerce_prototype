import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/home/cart/cart_controller.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/theme.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/widgets/delivery_button.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/data/in_memory_products.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/model/product.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/model/product_cart.dart';

class CartScreen extends GetWidget<CartController> {
  CartScreen({Key? key, this.onShoppingg}) : super(key: key);
  final VoidCallback? onShoppingg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Carrito de Compras',
            ),
          ),
        ),
        body: Obx(() => controller.totalItems.value == 0
            ? _EmptyCart(
                onShoppingg: onShoppingg,
              )
            : _FullCart()));
  }
}

class _ShoppingCartProduct extends StatelessWidget {
  final ProductCart productCart;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const _ShoppingCartProduct(
      {Key? key,
      required this.productCart,
      required this.onDelete,
      required this.onIncrement,
      required this.onDecrement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Theme.of(context).canvasColor,
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      flex: 2,
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                              child: Image.network(
                            productCart.product.image,
                            fit: BoxFit.cover,
                          )))),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(productCart.product.name),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          productCart.product.description,
                          style: Theme.of(context)
                              .textTheme
                              .overline!
                              .copyWith(color: DeliveryColors.lightGrey),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: onDecrement,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: DeliveryColors.white,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(productCart.quantity.toString())),
                              InkWell(
                                onTap: onIncrement,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: DeliveryColors.purple,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Icon(
                                    Icons.add,
                                    color: DeliveryColors.white,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '\$${productCart.product.price}',
                                style: TextStyle(color: DeliveryColors.green),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              right: 0,
              child: InkWell(
                child: CircleAvatar(
                  backgroundColor: DeliveryColors.pink,
                  child: Icon(Icons.delete_outline),
                ),
                onTap: onDelete,
              )),
        ],
      ),
    );
  }
}

class _FullCart extends GetWidget<CartController> {
  @override
  Widget build(BuildContext context) {
    var accentColor2 = Theme.of(context).accentColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Obx(
                () => ListView.builder(
                    itemCount: controller.cartList.length,
                    scrollDirection: Axis.horizontal,
                    itemExtent: 230,
                    itemBuilder: (context, index) {
                      final product = controller.cartList[index];
                      return _ShoppingCartProduct(
                          productCart: product,
                          onDelete: () {
                            controller.deleteProduct(product);
                          },
                          onIncrement: () {
                            controller.increment(product);
                          },
                          onDecrement: () {
                            controller.remove(product);
                          });
                    }),
              ),
            )),
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Theme.of(context).canvasColor,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SubTotal',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: accentColor2),
                          ),
                          Obx(
                            () => Text(
                              '\$${controller.totalPrice.value.toStringAsFixed(2)} co',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: accentColor2),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Domicilio',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: accentColor2),
                          ),
                          Text(
                            'Free',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: accentColor2),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total:',
                              style: TextStyle(
                                  color: accentColor2,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          Obx(
                            () => Text(
                              '\$${controller.totalPrice.value.toStringAsFixed(2)} co',
                              style: TextStyle(
                                  color: accentColor2,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      DeliveryButton(
                          onTap: controller.shopping, text: 'Comprar')
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}

class _EmptyCart extends StatelessWidget {
  final VoidCallback? onShoppingg;
  const _EmptyCart({
    Key? key,
    this.onShoppingg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/sad.png',
          color: DeliveryColors.green,
          height: 90,
        ),
        const SizedBox(
          height: 20,
        ),
        Text('No has agregado productos al carrito',
            style: TextStyle(color: Theme.of(context).accentColor),
            textAlign: TextAlign.center),
        const SizedBox(
          height: 20,
        ),
        Center(
            // ignore: deprecated_member_use
            child: RaisedButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Text(
              'Ir a comprar',
              style: TextStyle(color: DeliveryColors.white),
            ),
          ),
          onPressed: onShoppingg,
          color: DeliveryColors.purple,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ))
      ],
    );
  }
}
