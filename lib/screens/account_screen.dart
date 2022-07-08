import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutor_side_app/logic/providers/tutor_auth_provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late Authentication auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 220,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: Colors.deepPurple,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Account Details",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  Consumer<Authentication>(builder: (_, auth, __) {
                    return Text(
                      'Username: ' + auth.loggedUser!.username,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    );
                  }),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          Consumer<Authentication>(builder: (_, auth, __) {
            return Text(
              'First Name: ' + auth.loggedUser!.firstName,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            );
          }),
          const SizedBox(height: 20),
          Consumer<Authentication>(builder: (_, auth, __) {
            return Text(
              'Last Name: ' + auth.loggedUser!.lastName,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            );
          }),
          const SizedBox(height: 20),
          Consumer<Authentication>(builder: (_, auth, __) {
            return Text(
              'Email: ' + auth.loggedUser!.email,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            );
          }),
          const SizedBox(height: 20),
          Consumer<Authentication>(builder: (_, auth, __) {
            return Text(
              'Address: ' + auth.loggedUser!.address,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            );
          }),
          const SizedBox(height: 20),
          Consumer<Authentication>(builder: (_, auth, __) {
            return Text(
              'Contact: ' + auth.loggedUser!.phoneNumber,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            );
          }),
        ],
      ),
    );
  }
}
