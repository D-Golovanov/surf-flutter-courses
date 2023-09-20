import 'package:flutter/material.dart';

class GridPhoto extends StatelessWidget {
  const GridPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Image.asset('assets/images/logo_postgram.png'),
        )
      ],
    );
  }
}
