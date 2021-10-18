import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/model/product.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/domain/model/product_cart.dart';

class CartController extends GetxController {
  RxList<ProductCart> cartList = <ProductCart>[].obs;
  RxInt totalItems = 0.obs;
  void add(Product product) {
    final List<ProductCart> temp = List.from(cartList);
    bool found = false;
    for (ProductCart p in temp) {
      if (p.product.name == product.name) {
        p.quantity += 1;
        found = true;
        break;
      }
    }
    if (!found) {
      temp.add(ProductCart(product: product));
    }
    cartList.value = List<ProductCart>.from(temp);
    final int total = temp.fold(
        0, (previousValue, element) => element.quantity + previousValue);
    totalItems(total);
  }

  void remove(Product product) {}
}
