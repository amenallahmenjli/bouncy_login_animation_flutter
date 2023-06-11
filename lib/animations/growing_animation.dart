import 'package:flutter/material.dart';
import 'curves/bouncy_curve.dart';

class GrowingAnimation extends StatefulWidget {
  const GrowingAnimation(
      {super.key, required this.child, required this.factor});

  final double factor;
  final Widget child;

  @override
  State<GrowingAnimation> createState() => _GrowingAnimationState();
}

class _GrowingAnimationState extends State<GrowingAnimation>
    with TickerProviderStateMixin {
  // This will control the animation
  late AnimationController controller;

  // This will store the current state of the animation
  late Animation<double> growingAnimation;

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
    growingAnimation = Tween<double>(
      begin: 1.0,
      end: widget.factor,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: bouncyCurve,
    ));

    // tell the controller to play the animation
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: growingAnimation,
      child: widget.child,
    );
  }
}
