import 'package:depi_flutter/screens/main_app.dart';
import 'package:depi_flutter/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
              onPressed: () {},
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

  _login(BuildContext context) {
    if (emailController.text.contains('@') &&
        emailController.text.contains('.') &&
        passwordController.text.length >= 8) {
      emailController.clear();
      passwordController.clear();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MainApp();
          },
        ),
      );
    } else {
      if (!(emailController.text.contains('@') &&
          emailController.text.contains('.'))) {
        print('Enter valid email');
      }
      if (passwordController.text.length < 8) {
        print('Weak password');
      }
    }
  }
}
