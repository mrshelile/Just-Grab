import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:justgrab/data/home/remote/DTOs/product.dart';
import 'package:justgrab/domain/Product/product.dart';

class FoodDetail extends StatefulWidget {
  FoodDetail({super.key, required this.item});
  ProductModel item;
  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).copyWith().size;
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Text(
            "Details",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            width: 110,
          ),
          Icon(
            Icons.favorite,
            color: Colors.brown,
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Container(
                      // height:MediaQuery.of(context).size.height*0.2,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      // decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255)),
                      child: Image.network(
                        widget.item.imageUrl,
                      ))),
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.item.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      widget.item.price.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 20),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Description",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Description Description Description Description Description Description Description Description ",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
          Container(
            width: size.width,
            height: size.height,
            padding: EdgeInsets.only(
                left: size.width * 0.05, top: size.height * 0.82),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    decoration: const BoxDecoration(),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 204, 204, 204),
                                  offset: Offset(
                                    5,
                                    5.0,
                                  ),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0,
                                ),
                              ],
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(5)),
                          child: const TextButton(
                              onPressed: null,
                              child: Text(
                                "-",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("1"),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(5)),
                          child: const TextButton(
                              onPressed: null,
                              child: Text(
                                "+",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        )
                      ],
                    )),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.brown),
                    child: const TextButton(
                      onPressed: null,
                      child: Text(
                        "Add To Cart",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
