import 'package:flutter/material.dart';

class PersonalCard extends StatelessWidget {
  PersonalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('My Personal ID')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SizedBox(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.network(
                    'https://ichef.bbc.co.uk/ace/standard/1600/food/recipes/easy_chocolate_cake_31070_16x9.jpg.webp',
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('title'),
                      Text(
                        'description description description description description description description description description description description description description description description description description description description description ',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          OverflowBar(
                            children: [
                          
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//     -  0  +
