import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

import 'curves/bouncy_curve.dart';

class AnimationsSequence extends StatefulWidget {
  const AnimationsSequence({super.key, required this.child});

  final Widget child;

  @override
  State<AnimationsSequence> createState() => _AnimationsSequenceState();
}

class _AnimationsSequenceState extends State<AnimationsSequence>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late SequenceAnimation animationSequence;

  @override
  void initState() {
    super.initState();

    // Define a controller with 800ms duration
    controller = AnimationController(vsync: this);

    animationSequence = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<Offset>(
            begin: const Offset(0, -5),
            end: Offset.zero,
          ),
          from: Duration.zero,
          to: const Duration(milliseconds: 800),
          tag: "fall",
          curve: bouncyCurve,
        )
        .addAnimatable(
          animatable: Tween<double>(
            begin: 1.0,
            end: 2.5,
          ),
          from: const Duration(milliseconds: 900),
          to: const Duration(milliseconds: 1700),
          tag: "grow1",
          curve: bouncyCurve,
        )
        .addAnimatable(
          animatable: Tween<double>(
            begin: 1.0,
            end: 2,
          ),
          from: const Duration(milliseconds: 1800),
          to: const Duration(milliseconds: 2600),
          tag: "grow2",
          curve: bouncyCurve,
        )
        .addAnimatable(
          animatable: Tween<double>(
            begin: 1.0,
            end: 15,
          ),
          from: const Duration(milliseconds: 2700),
          to: const Duration(milliseconds: 3500),
          tag: "go",
          curve: bouncyCurve,
        )
        .addAnimatable(
          animatable: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ),
          from: const Duration(milliseconds: 3600),
          to: const Duration(milliseconds: 4600),
          tag: "appear",
          curve: Curves.fastLinearToSlowEaseIn,
        )
        .animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SlideTransition(
            position: animationSequence['fall'] as Animation<Offset>,
            child: ScaleTransition(
              scale: animationSequence['grow1'] as Animation<double>,
              child: ScaleTransition(
                scale: animationSequence['grow2'] as Animation<double>,
                child: ScaleTransition(
                  scale: animationSequence['go'] as Animation<double>,
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
        SlideTransition(
            position: animationSequence['appear'] as Animation<Offset>,
            child: Center(
              child: Container(
                height: 450,
                width: 250,
                color: Colors.blue,
                child: Text(
                    "The login screen should be here but I am so tired at this point so I won't implement it here"),
              ),
            )),
      ],
    );
  }
}
