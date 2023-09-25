import 'package:flutter/material.dart';

class ShadowSphere extends StatelessWidget {
  final AnimationController controller;

  ShadowSphere({
    super.key,
    required this.controller,
  })  : opacity = Tween<double>(
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
        ),
        position = Tween<double>(
          begin: 1,
          end: -6,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.4,
              1,
              curve: Curves.easeInOut,
            ),
          ),
        );

  final Animation<double> position;
  final Animation<double> opacity;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Positioned(
        top: screenSize.height / 2 + screenSize.width / 2 - 20 * position.value,
        left: 0,
        right: 0,
        child: Opacity(
          opacity: opacity.value,
          child: Image.asset('assets/images/ball_shadow.png'),
        ),
      ),
    );
  }
}
