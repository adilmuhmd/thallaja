import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/physics.dart';
import 'package:untitled1/splashscreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Splash',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
