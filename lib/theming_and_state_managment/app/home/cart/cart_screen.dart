import 'package:flutter/material.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/theme.dart';

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
      body: _EmptyCart(
        onShoppingg: onShoppingg,
      ),
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
