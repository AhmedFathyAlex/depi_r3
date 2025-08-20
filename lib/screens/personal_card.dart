import 'dart:math';

import 'package:depi_flutter/helpers/routes.dart';
import 'package:flutter/material.dart';

class PersonalCard extends StatefulWidget {
  PersonalCard({Key? key}) : super(key: key);

  @override
  State<PersonalCard> createState() => _PersonalCardState();
}

class _PersonalCardState extends State<PersonalCard> {
  bool isLoading = false;
  late Future myFuture;
  String resultText = 'None';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _asuncFunc();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.login);
              },
              child: Text('login'),
            ),
            DrawerButton(color: Colors.red),
            DrawerButton(color: Colors.red),
          ],
        ),
      ),
      appBar: AppBar(title: Text('My Personal ID')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child:
          FutureBuilder(future: myFuture, 
           builder: (context,snapshot){
              if (snapshot.hasData){
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(resultText),
                      ElevatedButton(
                        onPressed: () {
                            _asuncFunc();
                        },
                        child: Text('Click Me'),
                      ),
                    ],
                  );
              }
              if(snapshot.hasError){
               return Text('Error');
              }
              
              return   SizedBox(height: 30, child: CircularProgressIndicator());
              
           })
        ),
      ),
    );
  }

  _asuncFunc(){
      myFuture =  Future.delayed(const Duration(seconds: 2), () {
        return Random().nextBool() ? 'Success' : throw ('Error');
      });
  }
}

//     -  0  +
