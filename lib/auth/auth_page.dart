// import 'package:finder_app/screens/login_page.dart';
// import 'package:finder_app/screens/signup_page.dart';
// import 'package:flutter/material.dart';

// class AuthPage extends StatefulWidget {
//   const AuthPage({Key? key}) : super(key: key);

//   @override
//   State<AuthPage> createState() => _AuthPageState();
// }

// class _AuthPageState extends State<AuthPage> {
//   //Initially show the login Page

//   bool showLoginPage = true;

//   void toggleScreens() {
//     setState(() {
//       showLoginPage = !showLoginPage;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showLoginPage) {
//       return LoginPage(showRegisterPage: toggleScreens);
//     } else {
//       return SignUpPage(
//         showLoginPage: toggleScreens,
//       );
//     }
//   }
// }
