import 'package:depi_flutter/helpers/routes.dart';
import 'package:flutter/material.dart';

class PersonalCard extends StatefulWidget {
  PersonalCard({Key? key}) : super(key: key);

  @override
  State<PersonalCard> createState() => _PersonalCardState();
}

class _PersonalCardState extends State<PersonalCard> {
  PageController _controller = PageController();
  int _currentPage = 0; // Ephemeral State .
  List pages = [
    Center(child: Text('First Page')),
    Center(child: Text('Second Page')),
    Center(child: Text('Third Page')),
  ];
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
          child: PageView.builder(
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            itemBuilder: (context, index) {
              return pages[index];
            },
            
            itemCount: pages.length,
          ),
        ),
      ),
    );
  }
}

//     -  0  +
