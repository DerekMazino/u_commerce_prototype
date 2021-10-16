import 'package:flutter/material.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/theme.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/widgets/delivery_button.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/data/in_memory_products.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/model/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key, this.onShoppingg}) : super(key: key);
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
        body: /* _EmptyCart(
        onShoppingg: onShoppingg,
      ), */
            _FullCart());
  }
}

class _ShoppingCartProduct extends StatelessWidget {
  final Product product;

  const _ShoppingCartProduct({Key? key, required this.product})
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
                              child: Image.asset(
                            product.image,
                            fit: BoxFit.cover,
                          )))),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(product.name),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          product.description,
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
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: DeliveryColors.white,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text('0'),
                              ),
                              InkWell(
                                onTap: () {},
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
                                '\$${product.price}',
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
                onTap: () {},
              )),
        ],
      ),
    );
  }
}

class _FullCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ListView.builder(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  itemExtent: 230,
                  itemBuilder: (context, index) {
                    final Product product = products[index];
                    return _ShoppingCartProduct(
                      product: product,
                    );
                  }),
            )),
        Expanded(
            flex: 2,
            child: Container(
              color: Colors.yellow,
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
