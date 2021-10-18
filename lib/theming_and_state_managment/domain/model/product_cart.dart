import 'package:u_commerce_prototype/theming_and_state_managment/domain/model/product.dart';

class ProductCart {
  final Product product;
  int quantity;

  ProductCart({required this.product, this.quantity = 1});
}
