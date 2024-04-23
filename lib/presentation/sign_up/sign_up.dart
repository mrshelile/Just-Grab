import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:justgrab/colors.dart';

import 'package:justgrab/presentation/sign_in/sign_in.dart';
import 'package:justgrab/presentation/sign_in/widgets/background.dart';
import 'package:justgrab/presentation/sign_up/widgets/background.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? selectedValue;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    final _fullNameController = TextEditingController();
    final _contactController = TextEditingController();
    final _idNumberController = TextEditingController();
    final _addressController = TextEditingController();
    final _tokenController = TextEditingController();
    final _passwordController = TextEditingController();
    final _rePasswordController = TextEditingController();
    final _specialtyController = TextEditingController();
    final _formkey = GlobalKey<FormState>();
    final size = MediaQuery.of(context).copyWith().size;
    return Scaffold(
        floatingActionButton: Container(
          padding: EdgeInsets.only(left: size.width * 0.07),
          child: FloatingActionButton(
            backgroundColor: gold1,
            child: Icon(
              Icons.send,
              color: brown1,
            ),
            onPressed: () {},
          ),
        ),
        body: Stack(
          children: [
            //stack overlaps widgets
            Background1(),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.9,
              padding: EdgeInsets.only(
                  top: size.height * 0.3, left: size.width * 0.1),
              child: Form(
                  key: _formkey,
                  child: ListView(
                    children: [
                      TextFormField(
                        controller: _fullNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            labelStyle: TextStyle(color: brown1),
                            focusColor: gold1,
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(45)),
                                borderSide: BorderSide(color: brown1)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: brown1)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: brown1),
                            ),
                            labelText: "Full Name"),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field is required";
                          }
                          return null;
                        },
                        controller: _specialtyController,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            labelStyle: TextStyle(color: brown1),
                            focusColor: gold1,
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(45)),
                                borderSide: BorderSide(color: brown1)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: brown1)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: brown1),
                            ),
                            hintText: "+266 ...",
                            labelText: "Phone Number"),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        controller: _idNumberController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field is Required";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            labelStyle: TextStyle(color: brown1),
                            focusColor: brown1,
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(45)),
                                borderSide: BorderSide(color: brown1)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: brown1)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: brown1),
                            ),
                            labelText: "Email Address"),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (selectedValue.toString().toLowerCase() !=
                              "patient") {
                            if (value == null || value.isEmpty) {
                              return "Field is required";
                            }
                          }
                          return null;
                        },
                        controller: _passwordController,
                        obscureText: true,
                        // keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            labelStyle: TextStyle(
                              color: brown1,
                            ),
                            focusColor: brown1,
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(45)),
                                borderSide: BorderSide(color: brown1)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: brown1)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: brown1),
                            ),
                            labelText: "Password"),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (selectedValue.toString().toLowerCase() !=
                              "patient") {
                            if (value == null || value.isEmpty) {
                              return "Field is required";
                            }
                          }
                          return null;
                        },
                        controller: _passwordController,
                        obscureText: true,
                        // keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            labelStyle: TextStyle(
                              color: brown1,
                            ),
                            focusColor: brown1,
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(45)),
                                borderSide: BorderSide(color: brown1)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: brown1)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: brown1),
                            ),
                            labelText: "Confirm Password"),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Center(
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(brown1)),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignIn()));
                              },
                              child: const Text(
                                "Signin Here!",
                                style: TextStyle(color: Colors.white),
                              )))
                    ],
                  )),
            ),
          ],
        ));
  }
}
