import 'package:flutter/material.dart';

class HelloButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
	return ElevatedButton(
  	onPressed: () => print('Hello'),
  	child: Text('Say Hello'),
	);
  }
}
