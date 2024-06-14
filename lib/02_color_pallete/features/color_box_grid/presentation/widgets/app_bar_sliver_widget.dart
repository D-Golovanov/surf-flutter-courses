import 'package:flutter/material.dart';

class AppBarSliverWidget extends StatelessWidget {
  const AppBarSliverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Эксклюзивная палитра «Colored Box»',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.6,
              height: 34.0 / 30.0,
              color: Color(0xFF252838),
            ),
          ),
        ),
      ),
      expandedHeight: 120,
    );
  }
}
