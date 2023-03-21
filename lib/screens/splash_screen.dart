import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static String routeName = "/splashscreen";

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            width: 300,
            height: 47,
            child: Image.asset("assets/images/pidc-logo.png"),
          ),
        ),
      ),
      nextScreen: const OnBoardingScreen(),
      duration: 5000,
      splashIconSize: 350,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
