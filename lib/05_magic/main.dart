import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/05_magic/features/magic_ball/presentation/view/magic_ball.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MagicBall(),
    );
  }
}
