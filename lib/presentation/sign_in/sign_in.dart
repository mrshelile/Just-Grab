import 'package:flutter/material.dart';
import 'package:justgrab/application/auth/auth.dart';
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
  final _emailController = TextEditingController();
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
            if (_formKey.currentState!.validate()) {
              // ignore: unnecessary_null_comparison
              if (_emailController.text.toString() != null ||
                  _emailController.text.toString() != "") {
                var res = await Auth().userLogin(
                    emailAddress: _emailController.text.trim(),
                    password: _passwordController.text.trim());
                if (res.status.code == 200) {
                  setState(() {
                    this._error = '';
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                } else {
                  setState(() {
                    this._error = res.body;
                  });
                }
              }
            }
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
                        // inputFormatters: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.digitsOnly,
                        // ],
                        controller: _emailController,
                        validator: Validators.compose([
                          Validators.required('Email  is required'),

                          // Validators.email('wrong email format'),
                        ]),
                        // keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            labelStyle: const TextStyle(color: Colors.black),
                            focusColor: reeed1,
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(45)),
                                borderSide: BorderSide(color: brown1)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: brown1),
                            ),
                            labelText: "Email Address"),
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
                            labelStyle: TextStyle(color: Colors.black),
                            focusColor: reeed1,
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(45)),
                                borderSide: BorderSide(color: brown1)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
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
