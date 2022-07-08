import 'package:flutter/material.dart';
import 'package:tutor_side_app/screens/HomeScreen.dart';
import 'package:tutor_side_app/screens/job_posts.dart';
import 'package:tutor_side_app/screens/profileScreen.dart';
import 'package:tutor_side_app/screens/request_posts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int myIndex = 0;
  static final List<Widget> _NavScreens = <Widget>[
    HomeScreen(),
    RequestPost(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _NavScreens.elementAt(myIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff06283D),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Color(0xff06283D),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "Requests",
            backgroundColor: Color(0xff06283D),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: Color(0xff06283D),
          ),
        ],
      ),
    );
  }
}
