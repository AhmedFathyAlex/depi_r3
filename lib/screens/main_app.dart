import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          Icon(Icons.settings),
          SizedBox(width: 10),
          Icon(Icons.home),
          SizedBox(width: 10),
          Icon(Icons.arrow_forward_ios),
          SizedBox(width: 10),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/a.jpg'),
            ),
            Divider(),
            Text('The current counter'),
            Text(
              counter.toString(),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.blueGrey,
              ),
            ),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text('Logout')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });

          print(counter);
        },
      ),
    );
  }
}
