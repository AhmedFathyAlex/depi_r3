import 'package:depi_flutter/cart_provider.dart';
import 'package:depi_flutter/news/ui/screens/news.dart';
import 'package:depi_flutter/screens/login_page.dart';
import 'package:depi_flutter/screens/main_app.dart';
import 'package:depi_flutter/screens/my_catalog.dart';
import 'package:depi_flutter/screens/personal_card.dart';
import 'package:depi_flutter/screens/profile.dart';
import 'package:depi_flutter/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'helpers/routes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        // named routes
        routes: {
          Routes.login: (context) => LoginPage(),
          Routes.signup: (context) => Signup(),
          Routes.mainApp: (context) => MainApp(),
          Routes.card: (context) => PersonalCard(),
          Routes.profile: (context) => Profile(),
          Routes.news: (context) => News(),
        },
        home: MyCatalog(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
