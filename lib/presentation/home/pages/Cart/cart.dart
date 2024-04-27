import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justgrab/application/User/UserController.dart';
import 'package:justgrab/colors.dart';

import '../../../../store/store.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final storeController = Get.find<Store>();
  int deliveryOp = 0;
  String selectedDeliver = 'Thabo Trans';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).copyWith().size;
    return GetBuilder(
        init: storeController,
        builder: (context1) {
          return Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: size.width * 0.03,
                  right: size.width * 0.03,
                ),
                width: size.width * 1,
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 10);
                    },
                    scrollDirection: Axis.vertical,
                    itemCount: storeController.cart.length,
                    itemBuilder: (context, index) => Container(
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
                            trailing: IconButton(
                                onPressed: () => storeController
                                    .removeItem(storeController.cart[index]),
                                icon: Icon(
                                  Icons.delete,
                                  color: reeed1,
                                )),
                            leading: Image.network(
                              storeController.cart[index].imageUrl,
                              height: size.height * 0.05,
                            ),
                            title: Text(storeController.cart[index].name),
                            subtitle: Text(
                              "${storeController.cart[index].restaurant_name} M${storeController.cart[index].price}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ),
                        )),
              ),
              Positioned(
                right: 10,
                bottom: 2,
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(brown1)),
                    onPressed: () {
                      double priceTot = 0;
                      storeController.cart.forEach(
                        (element) => priceTot += element.price,
                      );
                      showModalBottomSheet(
                          context: context,
                          builder: (
                            context1,
                          ) {
                            return StatefulBuilder(
                                builder: (context, StateSetter setState1) {
                              return Wrap(
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.price_change),
                                    title:
                                        Text('price: M' + priceTot.toString()),
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.delivery_dining),
                                    title: SizedBox(
                                      width: size.width * 0.5,
                                      child: Row(
                                        children: [
                                          Radio(
                                            value: 0,
                                            toggleable: true,
                                            activeColor: gold1,
                                            groupValue: deliveryOp,
                                            onChanged: (value) {
                                              setState1(() {
                                                deliveryOp = value!;
                                              });
                                            },
                                          ),
                                          const Text("Pickup"),
                                          Radio(
                                            value: 1,
                                            activeColor: gold1,
                                            toggleable: true,
                                            groupValue: deliveryOp,
                                            onChanged: (value) {
                                              setState1(() {
                                                deliveryOp = value!;
                                              });
                                            },
                                          ),
                                          const Text("Deliver"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (deliveryOp == 1)
                                    ListTile(
                                        leading: Icon(Icons.drive_eta),
                                        title: DropdownMenu(
                                            enableSearch: true,
                                            initialSelection: "Thabo Trans",
                                            onSelected: (value) {
                                              setState(() {
                                                selectedDeliver = value!;
                                              });
                                            },
                                            dropdownMenuEntries: const [
                                              DropdownMenuEntry(
                                                  value: "Thabo Trans",
                                                  label: "Thabo Trans"),
                                              DropdownMenuEntry(
                                                  value: "Galaxy Trans",
                                                  label: "Galaxy Trans"),
                                              DropdownMenuEntry(
                                                  value: "Easyus Trans",
                                                  label: "Easyus Trans"),
                                              DropdownMenuEntry(
                                                  value: "Come Pick me Trans",
                                                  label: "Come Pick me Trans")
                                            ])),
                                  ListTile(
                                    selected: true,
                                    onTap: () async {
                                      try {
                                        await UserController().createUserOrder(
                                            orders: storeController.cart,
                                            deliveryType: deliveryOp == 0
                                                ? "pick up"
                                                : "delivery service",
                                            deliveryman: deliveryOp == 1
                                                ? selectedDeliver
                                                : null,
                                            totalPrice: priceTot);
                                      } catch (e) {
                                        print(e);
                                      }
                                      storeController.resetCart();
                                      Navigator.pop(context);
                                    },
                                    selectedTileColor: gold1,
                                    leading: Icon(
                                      Icons.check,
                                      color: white2,
                                    ),
                                    title: Text(
                                      "Proceed",
                                      style: TextStyle(color: white1),
                                    ),
                                  ),
                                ],
                              );
                            });
                          });
                    },
                    child: Text(
                      "Order Now",
                      style: TextStyle(color: white1),
                    )),
              )
            ],
          );
        });
  }
}
