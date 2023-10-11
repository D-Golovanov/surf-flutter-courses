import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  final Widget homeScreen;
  const MainApp({super.key, required this.homeScreen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: homeScreen,
    );
  }
}
