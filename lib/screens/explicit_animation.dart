import 'package:flutter/material.dart';

class ExplicitAnimation extends StatefulWidget {
  ExplicitAnimation({super.key});

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotationTransition(
            turns: _controller,
            child: Image.asset('assets/a.jpg'),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _controller.forward();
                },
                child: Text('forward'),
              ),

              ElevatedButton(
                onPressed: () {
                  _controller.repeat();
                },
                child: Text('forever'),
              ),

              ElevatedButton(
                onPressed: () {
                  _controller.stop();
                },
                child: Text('stop'),
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.reverse();
                },
                child: Text('reverse'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
