import 'package:flutter/material.dart';
import 'package:justgrab/application/auth/auth.dart';
import 'package:justgrab/colors.dart';
import 'package:justgrab/presentation/sign_in/sign_in.dart';
import 'package:justgrab/presentation/sign_up/widgets/Background.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isEmailCorrect = false;
  bool isObscure = false;
  String _error = "";
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _rePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).copyWith().size;
    return Scaffold(
      body: Stack(
        children: [
          Background1(),
          Container(
            padding: EdgeInsets.only(
                top: size.height * 0.3,
                left: size.width * 0.1,
                right: size.width * 0.1),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    validator: Validators.compose([
                      Validators.required('Full Names is required'),
                    ]),
                    controller: _fullNameController,
                    decoration: InputDecoration(
                        labelText: "Full Names",
                        hintText: "thabo",
                        focusColor: gold1,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: brown1)),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  TextFormField(
                    controller: _phoneNumberController,
                    validator: Validators.compose([
                      Validators.required('Phone Number is required'),
                    ]),
                    decoration: InputDecoration(
                        labelText: "Phone Numbers",
                        hintText: "+266 ...",
                        focusColor: gold1,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: brown1)),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: Validators.compose([
                      Validators.required('Email is required'),
                      Validators.email("Wrong email format")
                    ]),
                    decoration: InputDecoration(
                        labelText: "Email Address",
                        hintText: "example@company.com",
                        focusColor: gold1,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: brown1)),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: isObscure,
                    validator: Validators.compose([
                      Validators.required('Password is required'),
                      Validators.minLength(8, "Password is too shot (8)"),
                      Validators.patternRegExp(
                          RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
                          "Weak Password")
                    ]),
                    decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "*********",
                        focusColor: gold1,
                        suffix: IconButton(
                            onPressed: () => setState(() {
                                  isObscure = !isObscure;
                                }),
                            icon: Icon(
                              isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: brown1,
                            )),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: brown1)),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  TextFormField(
                    controller: _rePasswordController,
                    obscureText: isObscure,
                    validator: Validators.compose([
                      Validators.required('Confirm Password is required'),
                      Validators.minLength(8, "Password is too shot (8)"),
                      Validators.patternRegExp(
                          RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
                          "Weak Password")
                    ]),
                    decoration: InputDecoration(
                        labelText: "Confrm Password",
                        hintText: "*********",
                        focusColor: gold1,
                        suffix: IconButton(
                            onPressed: () => setState(() {
                                  isObscure = !isObscure;
                                }),
                            icon: Icon(
                              isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: brown1,
                            )),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: brown1)),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ));
                      },
                      child: const Text("Already Sign in? Login here")),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: size.width * 0.1, right: size.width * 0.1),
                    child: TextButton(
                        style: TextButton.styleFrom(backgroundColor: brown1),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _error = "";
                            });
                            if (_rePasswordController.text.trim().isNotEmpty &&
                                _passwordController.text.trim().isNotEmpty) {
                              final res = await Auth().signUp(
                                  emailAddress: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                  fullName: _fullNameController.text.trim(),
                                  phone: _phoneNumberController.text.trim());
                              if (res.statusCode == 201) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignIn(),
                                    ));
                              } else {
                                print(res);
                                setState(() {
                                  _error = res.body;
                                });
                              }
                            } else {
                              setState(() {
                                _error = "Passwords do not match";
                              });
                            }
                          }
                        },
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                              color: white1, fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
