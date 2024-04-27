import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:justgrab/application/auth/auth.dart';
import 'package:justgrab/data/home/remote/DTOs/product.dart';

class UserController {
  Future createUserOrder(
      {required List<ProductModel> orders,
      required String deliveryType,
      String? deliveryman}) async {
    List prepData = [];
    orders.forEach((ProductModel order) {
      prepData.add({
        "meal": Auth().firestore.collection("meals").doc(order.productId)
            as DocumentReference,
      });
    });

    return await Auth().firestore.collection("orders").add({
      "status": "waiting",
      "client":Auth().auth.currentUser!.uid,
      "delivery_type": deliveryType,
      "delivery_man": deliveryman ?? Auth().auth.currentUser!.uid,
      "meals": prepData
    });
  }
}
