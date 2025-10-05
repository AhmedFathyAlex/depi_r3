import 'package:depi_flutter/firebase_options.dart';
import 'package:depi_flutter/helpers/bloc_observer.dart';
import 'package:depi_flutter/news/ui/cubit/news_cubit.dart';
import 'package:depi_flutter/news/ui/screens/news.dart';
import 'package:depi_flutter/screens/ainmation_testing.dart';
import 'package:depi_flutter/screens/counter.dart';
import 'package:depi_flutter/screens/explicit_animation.dart';
import 'package:depi_flutter/todo/presentation/login_page.dart';
import 'package:depi_flutter/screens/main_app.dart';
import 'package:depi_flutter/screens/personal_card.dart';
import 'package:depi_flutter/screens/profile.dart';
import 'package:depi_flutter/todo/presentation/signup.dart';
import 'package:depi_flutter/todo/presentation/bloc/auth_bloc.dart';
import 'package:depi_flutter/state_managment/counter_bloc.dart';
import 'package:depi_flutter/todo/presentation/todo_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'helpers/routes.dart';

void main()async{
   Bloc.observer = MyBlocObserver();
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()..fetchData()),
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => AuthBloc()..initAuthBloc()),
      ],

      child: MaterialApp(
        // named routes
        routes: {
          Routes.login: (context) => LoginPage(),
          Routes.signup: (context) => Signup(),
          Routes.mainApp: (context) => MainApp(),
          Routes.card: (context) => PersonalCard(),
          Routes.profile: (context) => Profile(),
          Routes.news: (context) => News(), 
          Routes.todo: (context) => TodoScreen(), 

        },
        home: Signup(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
