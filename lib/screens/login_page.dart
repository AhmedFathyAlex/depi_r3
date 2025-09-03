import 'package:depi_flutter/helpers/routes.dart';
import 'package:depi_flutter/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  static String loginKey = 'hasLoggedIn';
  @override
  Widget build(BuildContext context) {
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
              onPressed: () => _login(context),
              child: Text('Login'),
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
  }

  _login(BuildContext context)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(LoginPage.loginKey, true);
    var name = nameController.text;
    var email = emailController.text;
    Navigator.pushReplacementNamed(
      context,
      Routes.profile,
      arguments: {'name': name, 'email': email},
    );
  }
}
