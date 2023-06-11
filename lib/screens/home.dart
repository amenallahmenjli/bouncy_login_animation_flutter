import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: 200,
      width: 200,
      child: Stack(children: [
        Container(
          color: Colors.black,
        ),
        AnimatedPositioned(
          left: 50,
          top: 200,
          curve: Sprung.custom(
            damping: 15,
            stiffness: 600,
            mass: 1.0,
            velocity: 0.0,
          ),
          duration: const Duration(milliseconds: 800),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            height: 50,
          ),
        ),
      ]),
    ));
  }
}
