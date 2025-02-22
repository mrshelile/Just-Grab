import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:justgrab/colors.dart';
import 'package:justgrab/presentation/home/pages/blocklist/widgets/Client_block_list.dart';
import 'package:justgrab/presentation/home/pages/blocklist/widgets/Resturant_block_list.dart';


class Blocklist extends StatefulWidget {
  const Blocklist({super.key});

  @override
  State<Blocklist> createState() => _BlocklistState();
}

class _BlocklistState extends State<Blocklist> {
  List<Widget> screens = [ResturantBlockList(), ClientBlockList()];

  int visited = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).copyWith().size;
    return Container(
      padding: EdgeInsets.only(
        left: size.width * 0.03,
        right: size.height * 0.03,
      ),
      width: size.width * 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * 1,
            height: size.width * 0.1,
            padding: EdgeInsets.only(left: size.width * 0.1),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: size.width * 0.2,
                );
              },
              itemBuilder: (context, index) {
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
                      color: visited == index ? brown1 : Colors.white),
                  // padding: EdgeInsets.all(10),
                  // margin: EdgeInsets.all(1),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          visited = index;
                        });
                      },
                      child: Text(
                        index == 0 ? "Resturant" : "Clients",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: visited == index ? Colors.white : brown1),
                      )),
                );
              },
              itemCount: 2,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              width: size.width * 1,
              height: size.height * 0.615,
              child: screens[visited])
        ],
      ),
    );
  }
}
