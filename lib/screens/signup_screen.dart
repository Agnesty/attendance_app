import 'package:aplikasi_phincon/models/user_model.dart';
import 'package:aplikasi_phincon/providers/user_provider.dart';
import 'package:aplikasi_phincon/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/http_exception.dart';
import '../providers/auth_provider.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup-screen';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _usernameController = TextEditingController();
  final _fullnameController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _isLoading = false;

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('An Error Occured!'),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Okay'))
              ],
            ));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      await authProvider.signUp(_usernameController.text.trim(),
          _passwordController.text, _fullnameController.text);
      final newUserProvider = UserProvider(
        authProvider.token!,
        authProvider.userId!,
        [],
      );
      await newUserProvider.addUsers(_usernameController.text.trim(),
          _fullnameController.text, _passwordController.text);
      FocusScope.of(context).unfocus();
      Navigator.of(context).pushNamed(HomeScreen.routeName);
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';

      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This username is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid username.';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that username.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      var errorMessage = 'Could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0062CD),
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                left: 160,
                top: -150,
                child: Container(
                  width: 319,
                  height: 319,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.05)),
                ),
              ),
              Container(
                child: Column(children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 15, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                "Create your account",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Text(
                                "Please fill Fullname, No. KTP, Ship & Password to register your app",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 7,
                      child: Container(
                        margin: const EdgeInsets.only(left: 8, right: 8),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: Form(
                            key: _formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  TextFormFieldKu(
                                    judulForm: "Username",
                                    hintName: "Username",
                                    controller: _usernameController,
                                    inputType: TextInputType.name,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Username can't empty";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormFieldKu(
                                    judulForm: "FullName",
                                    hintName: "FullName",
                                    controller: _fullnameController,
                                    inputType: TextInputType.name,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Fullname can't empty";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormFieldKu(
                                    judulForm: "Password",
                                    hintName: "*****************",
                                    controller: _passwordController,
                                    isObscureText: true,
                                    inputType: TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Password can't empty";
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormFieldKu(
                                    judulForm: "Repeat Password",
                                    hintName: "*****************",
                                    isObscureText: true,
                                    inputType: TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value != _passwordController.text) {
                                        return 'Passwords do not match!';
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: _submit,
                                        child: Container(
                                          width: 304.65,
                                          height: 57,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xFFDEE0E2)
                                                      .withOpacity(0.2),
                                                  offset: Offset(0.0, 2.0),
                                                  blurRadius: 20.0,
                                                  spreadRadius: 0.0,
                                                ),
                                              ],
                                              color: Color(0xFFFFC33A),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: const Center(
                                            child: Text(
                                              "Register",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF414B5A)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Already Have Account? please ",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w800,
                                                color: Color(0xFF8F8F8F)),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushReplacementNamed(
                                                      LoginScreen.routeName);
                                            },
                                            child: const Text(
                                              "Login",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w800,
                                                  color: Color(0xFF0062CD)),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
                ]),
              )
            ],
          ),
        ));
  }
}
