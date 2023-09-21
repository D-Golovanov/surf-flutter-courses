import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/04_gallery/features/grid_photo/presentation/widgets/widgets.dart';

class GridPhoto extends StatelessWidget {
  const GridPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          MySliverAppBar(),
          MySliverGrid(),
        ],
      ),
    );
  }
}
