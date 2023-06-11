import 'package:flutter/material.dart';
import 'curves/bouncy_curve.dart';

class FallingAnimation extends StatefulWidget {
  const FallingAnimation({super.key, required this.child});

  final Widget child;

  @override
  State<FallingAnimation> createState() => _FallingAnimationState();
}

class _FallingAnimationState extends State<FallingAnimation>
    with TickerProviderStateMixin {
  // This will control the animation
  late AnimationController controller;

  // This will store the current state of the animation
  late Animation<Offset> fallingAnimation;

  // The initState will run when the widget is built for the first time
  @override
  void initState() {
    super.initState();

    // Define a controller with 800ms duration
    controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // The falling animation will keep changing the offset of the circle with
    // a bouncy curve
    fallingAnimation = Tween<Offset>(
      begin: const Offset(0, -5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: bouncyCurve,
    ));

    // tell the controller to play the animation
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: fallingAnimation,
      child: widget.child,
    );
  }
}
