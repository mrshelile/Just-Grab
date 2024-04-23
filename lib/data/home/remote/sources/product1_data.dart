import 'package:justgrab/data/home/remote/DTOs/product.dart';

class ProductData {
  Stream getData() {
    return Future(() => [
          ProductModel(
              email_address: 'email2@thibos.com',
              name: 'Joseph',
              sub_name: "Best Bevs",
              phone_number: '+266 69356845',
              location: "Maseru"),
          ProductModel(
              location: "Qoaling",
              email_address: 'emaile@thibos.com',
              name: 'Thibos',
              sub_name: "Best food",
              phone_number: '+266 69356845'),
          ProductModel(
              location: "Quthing",
              email_address: 'email5@bevs.com',
              name: 'Lake Side',
              sub_name: "Best Bevs",
              phone_number: '+266 69356845'),
          ProductModel(
              location: "Ha Thamae",
              email_address: 'email1@thibos.com',
              name: 'Thibos',
              sub_name: "Best food",
              phone_number: '+266 69356845'),
          ProductModel(
              location: "T'senola",
              email_address: 'email1@thibos.com',
              name: 'Thibos',
              sub_name: "Best food",
              phone_number: '+266 69356845'),
          ProductModel(
              location: "Leribe",
              email_address: 'email1@thibos.com',
              name: 'Thibos',
              sub_name: "Best food",
              phone_number: '+266 69356845'),
          ProductModel(
              location: "Berea",
              email_address: 'email1@thibos.com',
              name: 'Thibos',
              sub_name: "Best food",
              phone_number: '+266 69356845')
        ]).asStream();
  }
}
