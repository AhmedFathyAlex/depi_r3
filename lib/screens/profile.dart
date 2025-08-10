import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  double xAxis = 25;

  double yAxis = -50;
  Color _paintedColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
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
              Positioned(
                left: xAxis,
                bottom: yAxis,
                child: Draggable(
                  onDragEnd: (details) {
                    xAxis = details.offset.dx;
                    yAxis = details.offset.dy;
                  },
                  feedback: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Divider(),
          _buildDraggable(),
          _buildDragTarget(),
        ],
      ),
    );
  }

  Draggable<int> _buildDraggable() {
    return Draggable(
      childWhenDragging: Icon(Icons.palette, color: Colors.grey, size: 48.0),
      feedback: Icon(Icons.brush, color: Colors.deepOrange, size: 80.0),
      data: Colors.deepOrange.value,
      child: Column(
        children: <Widget>[
          Icon(Icons.palette, color: Colors.deepOrange, size: 48.0),
          Text('Drag Me below to change color'),
        ],
      ),
    );
  }

  DragTarget<int> _buildDragTarget() {
    return DragTarget<int>(
      onAccept: (colorValue) {
        _paintedColor = Color(0xff457f89);
      },
      builder:
          (
            BuildContext context,
            List<dynamic> acceptedData,
            List<dynamic> rejectedData,
          ) =>
              acceptedData.isEmpty
                  ? Text(
                    'Drag To and see color change',
                    style: TextStyle(color: _paintedColor),
                  )
                  : Text(
                    'Painting Color: $acceptedData',
                    style: TextStyle(
                      color: Color(acceptedData[0]),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
    );
  }
}
