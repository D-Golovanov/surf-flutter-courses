import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/04_gallery/features/grid_photo/presentation/view/grid_photo.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GridPhoto(),
    );
  }
}
