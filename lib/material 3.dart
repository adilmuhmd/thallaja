// import 'package:flutter/material.dart';
// import 'dart:math' as math;
// import 'package:flutter/physics.dart';
//
// void main() => runApp(const ExpressiveDemoApp());
//
// class ExpressiveDemoApp extends StatefulWidget {
//   const ExpressiveDemoApp({super.key});
//
//   @override
//   State<ExpressiveDemoApp> createState() => _ExpressiveDemoAppState();
// }
//
// class _ExpressiveDemoAppState extends State<ExpressiveDemoApp> {
//   ThemeMode _themeMode = ThemeMode.system;
//
//   void _toggleTheme() {
//     setState(() {
//       _themeMode =
//       _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material 3 Expressive Demo',
//       debugShowCheckedModeBanner: false,
//       themeMode: _themeMode,
//       theme: ThemeData(
//         useMaterial3: true,
//         colorSchemeSeed: Colors.teal,
//         brightness: Brightness.light,
//       ),
//       darkTheme: ThemeData(
//         useMaterial3: true,
//         colorSchemeSeed: Colors.deepPurple,
//         brightness: Brightness.dark,
//       ),
//       home: HomePage(onToggleTheme: _toggleTheme),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   final VoidCallback onToggleTheme;
//   const HomePage({super.key, required this.onToggleTheme});
//
//   @override
//   Widget build(BuildContext context) {
//     final isWide = MediaQuery.of(context).size.width > 600;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Material 3 Expressive'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.color_lens),
//             onPressed: onToggleTheme,
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: isWide
//             ? Row(
//           children: const [
//             Expanded(child: ShapeMorphCard()),
//             SizedBox(width: 16),
//             Expanded(child: SpringBallWidget()),
//           ],
//         )
//             : Column(
//           children: const [
//             ShapeMorphCard(),
//             SizedBox(height: 16),
//             SpringBallWidget(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // 1. Shape Morphing Animation
// class ShapeMorphCard extends StatefulWidget {
//   const ShapeMorphCard({super.key});
//
//   @override
//   State<ShapeMorphCard> createState() => _ShapeMorphCardState();
// }
//
// class _ShapeMorphCardState extends State<ShapeMorphCard> {
//   bool toggled = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => setState(() => toggled = !toggled),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.easeInOut,
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.primaryContainer,
//           borderRadius: BorderRadius.circular(toggled ? 100 : 16),
//         ),
//         height: toggled ? 200 : 120,
//         child: Center(
//           child: Text(
//             toggled ? "Circle Shape" : "Rounded Rectangle",
//             style: Theme.of(context).textTheme.titleMedium,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // 2. Spring-based Physics Animation
// class SpringBallWidget extends StatefulWidget {
//   const SpringBallWidget({super.key});
//
//   @override
//   State<SpringBallWidget> createState() => _SpringBallWidgetState();
// }
//
// class _SpringBallWidgetState extends State<SpringBallWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   double _position = 0;
//
//   void _runSpringAnimation() {
//     final spring = SpringDescription(
//       mass: 1,
//       stiffness: 100,
//       damping: 10,
//     );
//
//     _controller.stop();       // Stop any existing animation
//     _controller.value = 0;    // Reset controller position
//
//     final simulation = SpringSimulation(spring, 0, 1, 0);
//     _controller.animateWith(simulation);
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController.unbounded(vsync: this)
//       ..addListener(() {
//         setState(() {
//           _position = _animation.value;
//         });
//       });
//
//     _animation = _controller.drive(Tween(begin: 0.0, end: 1.0));
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final offset = 100 * math.sin(_position * math.pi);
//     return Column(
//       children: [
//         Text(
//           "Spring-based Animation",
//           style: Theme.of(context).textTheme.titleMedium,
//         ),
//         const SizedBox(height: 20),
//         Transform.translate(
//           offset: Offset(0, offset),
//           child: Container(
//             width: 80,
//             height: 80,
//             decoration: BoxDecoration(
//               color: Theme.of(context).colorScheme.secondary,
//               shape: BoxShape.circle,
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: _runSpringAnimation,
//           child: const Text("Bounce!"),
//         )
//       ],
//     );
//   }
// }
