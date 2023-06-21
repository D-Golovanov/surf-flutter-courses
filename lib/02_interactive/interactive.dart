import 'package:flutter/material.dart';

import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Color color = Colors.amber;

  double widthScrean = 0;
  double heightScrean = 0;
  double widthContainer = 100;
  double heightContainer = 100;

  double offsetTop = 0;
  double offsetLeft = 0;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 2000),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  @override
  void didChangeDependencies() {
    widthScrean = MediaQuery.of(context).size.width;
    heightScrean = MediaQuery.of(context).size.height;

    offsetLeft = widthScrean / 2 - widthContainer / 2;
    offsetTop = heightScrean / 2 - heightContainer / 2;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeColorContainer() => setState(() {
        color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0);
      });

  void rotateContainer() =>
      _controller.isCompleted ? _controller.reverse() : _controller.forward();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: offsetTop,
            left: offsetLeft,
            width: widthContainer,
            height: heightContainer,
            child: RotationTransition(
              turns: _animation,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: color,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: changeColorContainer,
              onLongPress: rotateContainer,
              onPanUpdate: (details) => setState(() {
                offsetLeft = offsetLeft + details.delta.dx;
                offsetTop = offsetTop + details.delta.dy;
              }),
            ),
          )
        ],
      ),
    );
  }
}
