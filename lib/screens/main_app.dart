import 'package:depi_flutter/helpers/routes.dart';
import 'package:depi_flutter/screens/login_page.dart';
import 'package:depi_flutter/screens/profile.dart';
import 'package:depi_flutter/screens/signup.dart';
import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int index = 0;
  List<Widget> screens = [LoginPage(), Profile(), Signup()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: screens[index]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (clickedIndex) {
          setState(() {
            index = clickedIndex;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
