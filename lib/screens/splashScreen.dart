import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:tutor_side_app/screens/auth_root.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff080f80),
      body: AnimatedSplashScreen(
        splash: Image.asset(
          "assets/logo_finder.png",
          width: 500,
          height: 500,
        ),
        nextScreen: const AuthRoot(),
        splashTransition: SplashTransition.fadeTransition,
        //backgroundColor: const Color(0xff080f80),
        duration: 5000,
      ),
    );
  }
}
