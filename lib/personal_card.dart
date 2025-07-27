import 'package:flutter/material.dart';

class PersonalCard extends StatelessWidget {
  PersonalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Personal ID')),
      body: Center(
        child: Column(
          children: [
            Expanded(child: Container(color: Colors.amber)),
            Expanded(child: Container(color: Colors.red)),
            Expanded(child: Container(color: Colors.cyan)),
          ],
        ),
      ),
    );
  }
}
