import 'package:flutter/material.dart';

class BottomHint extends StatelessWidget {
  final AnimationController controller;
  BottomHint({
    super.key,
    required this.controller,
  }) : opacity = Tween<double>(
          begin: 1,
          end: 0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0,
              1,
              curve: Curves.easeInOut,
            ),
          ),
        );

  final Animation<double> opacity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24,
      left: 0,
      right: 0,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Opacity(
          opacity: opacity.value,
          child: const Text(
            'Нажмите на шар или\nпотрясите телефон',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.14,
              color: Color(0xFF727272),
            ),
          ),
        ),
      ),
    );
  }
}
