import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled1/signinpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  bool _showFirst = true;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // Start oval reveal after 2 seconds
    Timer(const Duration(seconds: 2), () {
      _controller.forward();
      setState(() => _showFirst = false);
    });

    // Navigate to the next screen after 4 seconds
    Timer(const Duration(milliseconds: 2800), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SignInScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        // Base background
        Container(color: const Color(0xFF0E4099)),

        // Curvy oval reveal transition
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final radius = _animation.value * 2.0 * sqrt(pow(size.width, 2) + pow(size.height, 2));
            return ClipPath(
              clipper: OvalRevealClipper(radius),
              child: Container(color: const Color(0xFFDBEFF7)),
            );
          },
        ),

        // Animated Logo
        Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 800),
            transitionBuilder: (Widget child, Animation<double> animation) =>
                FadeTransition(opacity: animation, child: child),
            child: _showFirst
                ? Column(
              key: const ValueKey(1),
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset("icons/Logo.svg", height: 42, width: 275),
                SvgPicture.asset("icons/COOL PARTNER.svg", height: 17.1, width: 105),
              ],
            )
                : Column(
              key: const ValueKey(2),
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset("icons/Logo (1).svg", height: 42, width: 275),
                SvgPicture.asset("icons/COOL PARTNER (1).svg", height: 17.1, width: 105),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class OvalRevealClipper extends CustomClipper<Path> {
  final double radius;

  OvalRevealClipper(this.radius);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius));
    return path;
  }

  @override
  bool shouldReclip(OvalRevealClipper oldClipper) {
    return radius != oldClipper.radius;
  }
}
