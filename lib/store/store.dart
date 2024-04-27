import 'package:get/get.dart';
import 'package:justgrab/data/home/remote/DTOs/product.dart';

class Store extends GetxController {
  List<ProductModel> cart = [];
  void addToCart(ProductModel product) {
    cart.add(product);
    update();
  }

  void resetCart() {
    cart.clear();
    update();
  }

  void removeFromCart() {
    cart.removeLast();
    update();
  }

  void removeItem(ProductModel product) {
    cart.remove(product);
    update();
  }
}
