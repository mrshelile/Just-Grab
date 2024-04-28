import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justgrab/application/User/UserController.dart';
import 'package:justgrab/application/auth/auth.dart';
import 'package:justgrab/colors.dart';
import 'package:justgrab/store/store.dart';

class OrdersList extends StatefulWidget {
  const OrdersList({super.key});

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  final storeController = Get.find<Store>();
  Future<String> getImageDownloadUrl({required String image}) async {
    final storageRef = FirebaseStorage.instance.ref().child(image);

    try {
      final url = await storageRef.getDownloadURL();
      return url;
    } catch (error) {
      // Handle error getting download URL
      print(error);
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).copyWith().size;
    return StreamBuilder(
        stream: Auth()
            .firestore
            .collection("orders")
            .where("client", isEqualTo: Auth().auth.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          // print(snapshot.data!.docs.first['client']);
          if (snapshot.hasError || !snapshot.hasData) {
            return SizedBox();
          }

          List<QueryDocumentSnapshot> data = snapshot.data!.docs;

          // print((data.first.data()! as Map<String, dynamic>)['meals']);
          return ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
              scrollDirection: Axis.vertical,
              itemCount: data.length,
              itemBuilder: (context, index) => StreamBuilder(
                  stream:
                      ((data[index].data()! as Map<String, dynamic>)['meals'][0]
                              ['meal'] as DocumentReference)
                          .snapshots(),
                  builder: (context, snapshot1) {
                    if (snapshot1.hasError || !snapshot1.hasData) {
                      return SizedBox();
                    }

                    Map data1 = snapshot1.data!.data() as Map;

                    return Container(
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 216, 221, 219),
                              offset: Offset(
                                5,
                                5.0,
                              ),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: ListTile(
                        trailing: data[index]['status'] == 'processed'
                            ? IconButton(
                                onPressed: () async {
                                  try {
                                    await UserController()
                                        .approveArrivalOfProduct();
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                icon: Icon(
                                  Icons.approval,
                                  color: brown1,
                                  size: 35,
                                ))
                            : Text(
                                data[index]['status'].toString(),
                                style: TextStyle(
                                    color: gold1,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                        leading: StreamBuilder(
                            stream: getImageDownloadUrl(image: data1['image'])
                                .asStream(),
                            builder: (context, imageSnap) {
                              if (imageSnap.hasError) {
                                return SizedBox();
                              }
                              if (!imageSnap.hasData) return const SizedBox();
                              return Image.network(
                                imageSnap.data.toString(),
                                height: size.height * 0.05,
                              );
                            }),
                        title: Text(
                            "Order total: M${(data[index].data()! as Map)['total_price'].toString()}"),
                        subtitle: Text(
                          snapshot.data!.docs[index].id,
                          style: const TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ),
                    );
                  }));
        });
  }
}
