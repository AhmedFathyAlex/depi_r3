import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AinmationTesting extends StatefulWidget {
  const AinmationTesting({super.key});

  @override
  State<AinmationTesting> createState() => _AinmationTestingState();
}

class _AinmationTestingState extends State<AinmationTesting> with SingleTickerProviderStateMixin{
  Color containerColor = Colors.red;
  TextStyle style = TextStyle(fontSize: 40, color: Colors.red);
  double size = 200;
  bool isHidden = false;
  double imageOpacity = 1.0;
  double angle = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              child: Text('Animation Tutorial'),
              style: style,
              duration: Duration(seconds: 1),
            ),

            // AnimatedOpacity(
            //   child: Image.asset('assets/a.jpg'),
            //   //  AnimatedContainer(
            //   //   duration: Duration(seconds: 1),
            //   //   width: size,
            //   //   height: size,
            //   //   decoration: BoxDecoration(
            //   //     color: containerColor,
            //   //     borderRadius:
            //   //         size == 100
            //   //             ? BorderRadius.circular(0)
            //   //             : BorderRadius.circular(100),
            //   //   ),
            //   // ),
            //   duration: Duration(milliseconds: 100),
            //   opacity: imageOpacity,
            // ),
            TweenAnimationBuilder(
              tween: Tween(begin: 0, end: 2 * pi),
              duration: Duration(seconds: 5),
              builder: (context, value, child) {
                return Transform.rotate(
                  angle: value.toDouble(),
                  child: Stack(
                    children: [
                      Image.asset('assets/a.jpg', width: 200, height: 200),
                      Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 200,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                );
              },
            ),
            // AnimatedRotation(
            //   turns: angle,
            //   duration: Duration(seconds: 1),
            //   child: Image.asset('assets/a.jpg'),
            // ),
            // Slider(
            //   min: 0,
            //   max: 2 * pi,
            //   value: angle,
            //   onChanged: (newValue) {
            //     setState(() {
            //       angle = newValue;
            //     });
            //   },
            // ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (containerColor == Colors.red) {
                    setState(() {
                      containerColor = Colors.blue;
                      style = TextStyle(fontSize: 20, color: Colors.blue);
                    });
                  } else {
                    setState(() {
                      containerColor = Colors.red;
                      style = TextStyle(fontSize: 40, color: Colors.red);
                    });
                  }
                });
              },
              child: Text('Animate Color'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (size == 200) {
                    setState(() {
                      size = 100;
                    });
                  } else {
                    setState(() {
                      size = 200;
                    });
                  }
                });
              },
              child: Text('Animate Size'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isHidden = !isHidden;
                });
              },
              child: Text(isHidden ? 'Show' : 'Hide'),
            ),
          ],
        ),
      ),
    );
  }
}
