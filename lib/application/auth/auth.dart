import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Auth {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  Future<Response> userLogin(
      {required String emailAddress, required String password}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      // var de = await firestore.collection("users");
      var res = await firestore
          .collection("users")
          .where("user_id", isEqualTo: userCredential.user!.uid)
          .where("allowed", isEqualTo: true)
          .get();
      if (res.docs.isEmpty) {
        throw FirebaseAuthException(code: "not-client");
      }
      return const Response(statusCode: 200, body: "Authenticated");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Response(statusCode: 204, body: "User not found");
      } else if (e.code == 'wrong-password') {
        return const Response(statusCode: 401, body: "Wrong password");
      } else if (e.code == 'not-client') {
        return const Response(statusCode: 400, body: "unauthenticated");
      }

      return const Response(statusCode: 500, body: "Wrong credetials");
    }
  }

  Future<Response> signUp(
      {required String emailAddress,
      required String password,
      required String fullName,
      required String phone}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: emailAddress, password: password);

      await firestore.collection("users").add({
        "full_name": fullName,
        "phone_number": phone,
        "location": "",
        "orders": [],
        "allowed": true,
        "email": emailAddress,
        "user_id": userCredential.user!.uid
      });
      return const Response(statusCode: 201, body: "user created");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return const Response(statusCode: 409, body: "weak password");
      } else if (e.code == 'email-already-in-use') {
        return const Response(statusCode: 409, body: "email already in use");
      }
      return const Response(statusCode: 500, body: "Unhandled error");
    } catch (e) {
      return const Response(statusCode: 500, body: "Unhandled error");
    }
  }
}
