import 'package:depi_flutter/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signup')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://images.squarespace-cdn.com/content/v1/52a44c83e4b0f6168e523eec/1397507034346-X8OKQU9E0SNONX2KRV74/signup.png',
              width: 200,
            ),
            CustomTextField(label: 'user name', controller: nameController),
            CustomTextField(label: 'Email', controller: emailController),
            CustomTextField(
              label: 'Password',
              controller: passwordController,
              isPassword: true,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Sign up')),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text(
                'Alrady have account ? Sign in',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
