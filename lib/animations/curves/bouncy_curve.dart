import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

// A custom bouncy spring curve made using the Sprung Package
final Curve bouncyCurve = Sprung.custom(
  damping: 15,
  stiffness: 800,
  mass: 1.0,
  velocity: 0.0,
);
