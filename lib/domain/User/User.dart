import 'package:justgrab/domain/Product/product.dart';

class ClientModel {
  ClientModel({required this.emailAddress});
  String? _fullName;
  String emailAddress;
  Map? _location;
  List<Product> _orders = [];
  List<Product> _cart = [];

  void setOrder({required Product order}) {
    this._orders.add(order);
  }
}
