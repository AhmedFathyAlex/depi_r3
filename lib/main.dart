import 'package:depi_flutter/helpers/bloc_observer.dart';
import 'package:depi_flutter/news/ui/cubit/news_cubit.dart';
import 'package:depi_flutter/news/ui/screens/news.dart';
import 'package:depi_flutter/screens/counter.dart';
import 'package:depi_flutter/screens/login_page.dart';
import 'package:depi_flutter/screens/main_app.dart';
import 'package:depi_flutter/screens/personal_card.dart';
import 'package:depi_flutter/screens/profile.dart';
import 'package:depi_flutter/screens/signup.dart';
import 'package:depi_flutter/state_managment/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'helpers/routes.dart';

void main() {
   Bloc.observer = MyBlocObserver();
  runApp(
    BlocProvider(
      create: (context) => CounterCubit(),
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
        home: Counter(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
