import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/05_magic/features/magic_ball/presentation/view/magic_ball_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const MagicBallScreen(),
    );
  }
}
