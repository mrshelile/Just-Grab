import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justgrab/colors.dart';
import 'package:justgrab/presentation/sign_in/sign_in.dart';
import 'package:justgrab/store/store.dart';

class OnBoarding extends StatelessWidget {
  final store = Get.put(Store());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).copyWith().size;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        //stack overlaps widgets
        Positioned(
          left: size.width * 0.05,
          top: size.height * 0.04,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Come and dine with",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w900, color: brown1),
              ),
              Text(
                "The best Chefs",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w700, color: gold1),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(
                          color: Colors.teal,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // print("pressed");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  },
                  child: const Text(
                    "Continue Here",
                    style: TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
        ClipPath(
          //upper clippath with less height
          clipper: WaveClipper(), //set our custom wave clipper.
          child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 94, 94, 94),
                Color.fromARGB(255, 164, 163, 88)
              ])),
              height: size.height,
              alignment: Alignment.center,
              child: const Text(
                "",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              )),
        ),
        Positioned(
            left: size.width * 0.04,
            top: size.height * 0.25,
            child: SizedBox(
              width: size.width,
              child: Image.asset("assets/sit.png"),
            ))
      ],
    ));
  }
}

//Costom CLipper class with Path
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0,
        size.height * 0.5); //start path with this if you are making at bottom

    var firstStart = Offset(size.width / 5, size.height * 0.7);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2, size.height * 0.65);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height * 0.6);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height * 0.6);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    var thirdStart =
        Offset(size.width - (size.width / 3.24), size.height * 0.65);
    //third point of quadratic bezier curve
    var thirdEnd = Offset(size.width, size.height * 0.6);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(
        thirdStart.dx, thirdStart.dy, thirdEnd.dx, thirdEnd.dy);

    path.lineTo(size.width,
        size.height - 10); //end with this path if you are making wave at bottom
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}
