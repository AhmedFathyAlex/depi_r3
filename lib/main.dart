import 'package:depi_flutter/screens/login_page.dart';
import 'package:depi_flutter/screens/main_app.dart';
import 'package:depi_flutter/screens/personal_card.dart';
import 'package:depi_flutter/screens/profile.dart';
import 'package:depi_flutter/screens/signup.dart';
import 'package:flutter/material.dart';
import 'helpers/routes.dart';

void main() {
  runApp(
    MaterialApp(
      // named routes
      routes: {
        Routes.login: (context) => LoginPage(),
        Routes.signup: (context) => Signup(),
        Routes.mainApp: (context) => MainApp(),
        Routes.card: (context) => PersonalCard(),
        Routes.profile: (context) => Profile(),
      },
      initialRoute: Routes.card,
      debugShowCheckedModeBanner: false,
    ),
  );
}
