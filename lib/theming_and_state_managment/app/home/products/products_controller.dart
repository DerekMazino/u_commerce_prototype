import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/model/product.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/repositories/user_repository.dart';

class ProductsController extends GetxController {
  final UserRepositoy userRepositoy;

  ProductsController({required this.userRepositoy});
  RxList<Product> productList = <Product>[].obs;

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  void loadProducts() async {
    final result = await userRepositoy.getProducts();
    productList.addAll(result);
  }
}
