import 'package:depi_flutter/helpers/routes.dart';
import 'package:depi_flutter/state_managment/auth/auth_bloc.dart';
import 'package:depi_flutter/state_managment/auth/auth_event.dart';
import 'package:depi_flutter/state_managment/auth/auth_state.dart';
import 'package:depi_flutter/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  static String loginKey = 'hasLoggedIn';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, Routes.profile);
        }else if(state is Error){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message),
          backgroundColor: Colors.red,));
        }
      },
      builder: (context, state) {
        var bloc = context.read<AuthBloc>();

        return Scaffold(
          appBar: AppBar(title: Text('Login')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/14018/14018816.png',
                  width: 200,
                ),
                CustomTextField(label: 'user name', controller: nameController),
                CustomTextField(label: 'Email', controller: emailController),
                CustomTextField(
                  label: 'Password',
                  controller: passwordController,
                  isPassword: true,
                ),
                ElevatedButton(
                  onPressed: (){
                    bloc.add(LoginEvent(emailController.text, passwordController.text));
                  },
                  child: state is Loadig ? CircularProgressIndicator() : Text('Login'),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.signup);
                  },
                  child: Text(
                    'First time ? Sign up',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
