import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:justgrab/colors.dart';
import 'package:justgrab/presentation/home/Home.dart';

import 'package:justgrab/presentation/sign_in/widgets/background.dart';
import 'package:justgrab/presentation/sign_up/sign_up.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _error = '';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).copyWith().size;
    // final store = Get.find<Store>();

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: brown1,
          child: Icon(
            Icons.send,
            color: gold1,
          ),
          onPressed: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ));
          },
        ),
        body: Stack(
          children: [
            //stack overlaps widgets
            const Background(),
            Container(
              width: size.width * 0.9,
              // height: size.height*0.3,
              // color: Colors.white,
              padding: EdgeInsets.only(
                  top: size.height * 0.3, left: size.width * 0.1),
              child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        controller: _usernameController,
                        validator: Validators.compose([
                          Validators.required('ID number is required'),

                          // Validators.email('wrong email format'),
                        ]),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            labelStyle: const TextStyle(color: Colors.cyan),
                            focusColor: reeed1,
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(45)),
                                borderSide: BorderSide(color: brown1)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: brown1),
                            ),
                            labelText: "National ID number"),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        validator: Validators.compose([
                          Validators.required('Password is required'),
                          // Validators.email('wrong email format'),
                        ]),
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            labelStyle: const TextStyle(color: Colors.cyan),
                            focusColor: reeed1,
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(45)),
                                borderSide: BorderSide(color: brown1)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: gold1),
                            ),
                            labelText: "Password"),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        _error,
                        style: const TextStyle(color: Colors.red),
                      ),
                      Center(
                          child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(brown1),
                              ),
                              // borderRadius: BorderRadius.all(Radius.circular(5)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUp(),
                                    ));
                              },
                              child: const Text(
                                "Go to Create Account",
                                style: TextStyle(color: Colors.white),
                              )))
                    ],
                  )),
            ),
          ],
        ));
  }
}
