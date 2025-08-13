import 'package:depi_flutter/helpers/routes.dart';
import 'package:depi_flutter/screens/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/LinkedIn_logo_initials.png/500px-LinkedIn_logo_initials.png',
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home, color: Colors.grey, size: 50),
            Icon(Icons.people, color: Colors.grey, size: 50),
            Icon(Icons.business, color: Colors.grey, size: 50),
            Icon(Icons.chat, color: Colors.grey, size: 50),
            Icon(Icons.notifications, color: Colors.grey, size: 50),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
            ),
          ),
          Icon(Icons.more_horiz, color: Colors.grey, size: 50),
        ],
      ),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                'https://marketplace.canva.com/EAECJXaRRew/3/0/1600w/canva-do-what-is-right-starry-sky-facebook-cover-4SpKW5MtQl4.jpg',
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Text(''),
          Text(''),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.login);
            },
            child: Text('Logout'),
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    color: Colors.amber,
                    child: Column(),
                    height: 400,
                  );
                },
              );
            },
            child: Text('show Dialog'),
          ),
        ],
      ),
    );
  }
}
