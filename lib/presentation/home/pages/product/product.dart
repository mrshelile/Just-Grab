import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

import 'package:justgrab/colors.dart';
import 'package:justgrab/data/home/remote/sources/product1_data.dart';
import 'package:justgrab/presentation/home/pages/product/pages/food_page.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<String> productImage = [
    "assets/drink1.png",
    "assets/res1.jpg",
    "assets/res2.png"
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).copyWith().size;
    Random random = Random();
    return Container(
        padding: EdgeInsets.only(
          left: size.width * 0.03,
          right: size.width * 0.03,
        ),
        width: size.width * 1,
        child: StreamBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError || !snapshot.hasData) {
              return const SizedBox();
            }
            return GridView(
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 16 / 23,
                  crossAxisSpacing: 16,
                  crossAxisCount: 2,
                  mainAxisSpacing: 16),
              children: List.generate(
                  snapshot.data!.length,
                  (index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FoodDetail(),
                              ));
                        },
                        child: Container(
                          // margin: EdgeInsets.all(5),
                          height: 200,
                          // padding: EdgeInsets.all(70),
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
                          child: Wrap(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              Container(
                                width: size.width,
                                height: size.height * 0.17,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    image: DecorationImage(
                                        image: AssetImage(productImage[random
                                            .nextInt(productImage.length)]),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    snapshot.data[index].name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    snapshot.data[index].sub_name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12),
                                  )),
                              Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    snapshot.data[index].email_address,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12),
                                  )),
                              Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    snapshot.data[index].phone_number,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12),
                                  )),
                              Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: gold1,
                                      ),
                                      Text(
                                        snapshot.data[index].location,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      )),
            );
          },
          stream: ProductData().getData(),
        ));
  }
}
