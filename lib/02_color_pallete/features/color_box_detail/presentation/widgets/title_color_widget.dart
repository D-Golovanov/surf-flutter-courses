import 'package:flutter/material.dart';

class TitleColorWidget extends StatelessWidget {
  const TitleColorWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.6,
        height: 34.0 / 30.0,
        color: Color(0xFF252838),
      ),
    );
  }
}
