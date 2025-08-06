import 'package:depi_flutter/screens/login_page.dart';
import 'package:depi_flutter/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  String selectedGender = '';
  bool termsAndConditions = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signup')),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.network(
                'https://images.squarespace-cdn.com/content/v1/52a44c83e4b0f6168e523eec/1397507034346-X8OKQU9E0SNONX2KRV74/signup.png',
                width: 200,
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: 'first name',
                      controller: firstNameController,
                      validatorFunc: (input) {
                        if (input!.length > 2) return null;
                        return 'Invalid name';
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      label: 'last name',
                      controller: lastNameController,
                      validatorFunc: (input) {
                        if (input!.length > 2) return null;
                        return 'Invalid name';
                      },
                    ),
                  ),
                ],
              ),

              CustomTextField(label: 'Email', controller: emailController,
               validatorFunc: (input) {
                  if (input!.contains('@') && input!.contains('.')) return null;
                  return 'email must contains ( @ ) and ( . )';
                },
              ),
              CustomTextField(
                label: 'Password',
                controller: passwordController,
                isPassword: true,
                 validatorFunc: (input) {
                  if (input!.length >= 8) return null;
                  return 'weak password';
                },
              ),
              CustomTextField(
                label: 'Confirm Password',
                controller: confirmPasswordController,
                isPassword: true,
                validatorFunc: (input) {
                  if(input == passwordController.text) return null;
                   return 'passwords must match';
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RadioMenuButton<String>(
                    value: 'male',
                    onChanged: (newOption) {
                      setState(() {
                        selectedGender = newOption ?? '';
                      });
                    },
                    groupValue: selectedGender,
                    child: Text('male'),
                  ),
                  RadioMenuButton<String>(
                    value: 'female',
                    onChanged: (newOption) {
                      setState(() {
                        selectedGender = newOption ?? '';
                      });
                    },
                    groupValue: selectedGender,
                    child: Text('female'),
                  ),
                  RadioMenuButton<String>(
                    value: 'other',
                    onChanged: (newOption) {
                      setState(() {
                        selectedGender = newOption ?? '';
                      });
                    },
                    groupValue: selectedGender,
                    child: Text('other'),
                  ),
                ],
              ),

              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 50),
                  Checkbox(
                    value: termsAndConditions,
                    onChanged: (newValue) {
                      setState(() {
                        termsAndConditions = newValue ?? false;
                      });
                    },
                  ),
                  Text('Agree to terms and conditions'),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  var validated = _formKey.currentState!.validate();
                  print(validated);
                },
                child: Text('Sign up'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ),
                  );
                },
                child: Text(
                  'Alrady have account ? Sign in',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
