import 'package:aplikasi_phincon/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'signup_screen.dart';

class ForgotPassword extends StatelessWidget {
  static const routeName = '/forgot-screen';
  const ForgotPassword({super.key});

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
              Column(children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              "Forgot password",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Please fill Usernaame, Password & New Password to reset your account",
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              TextFormFieldKu(
                                judulForm: "No. KTP",
                                hintName: "3200009991121212",
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormFieldKu(
                                judulForm: "Password",
                                hintName: "*****************",
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormFieldKu(
                                judulForm: "Repeat Password",
                                hintName: "*****************",
                              ),
                              const SizedBox(
                                height: 140,
                              ),
                              Column(
                                children: [
                                  Container(
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
                                        borderRadius: BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Text(
                                        "Reset Password",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF414B5A)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                    )),
              ])
            ],
          ),
        ));
  }
}
