import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:u_commerce_prototype/theming_and_state_managment/domain/model/product.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final String _baseUrl = 'flutter-u-commerce-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  @override
  Future<List<Product>> getProducts() async {
    final url = Uri.https(_baseUrl, 'Products.json');
    final resp = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      this.products.add(tempProduct);
    });
    return this.products;
  }
}
