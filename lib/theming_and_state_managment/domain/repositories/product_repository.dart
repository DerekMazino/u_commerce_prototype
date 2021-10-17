import 'package:u_commerce_prototype/theming_and_state_managment/domain/model/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
