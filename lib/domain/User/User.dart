import 'package:justgrab/domain/Product/product.dart';

class ClientModel {
  ClientModel(
      {required this.emailAddress,
      this.fullName,
      this.cart,
      this.orders,
      this.location});
  String? fullName;
  String emailAddress;
  Map? location;
  List<Product>? orders = [];
  List<Product>? cart = [];
}
