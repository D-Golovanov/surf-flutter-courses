import 'package:flutter/material.dart';

class Sphere extends StatelessWidget {
  final BuildContext context;
  final AnimationController controllerRotate;
  final AnimationController controllerScale;

  Sphere({
    super.key,
    required this.context,
    required this.controllerRotate,
    required this.controllerScale,
  })  : rotate = Tween<double>(
          begin: 0,
          end: 6.28,
        ).animate(CurvedAnimation(
          parent: controllerRotate,
          curve: const Interval(
            0,
            1,
            curve: Curves.linear,
          ),
        )),
        scale = Tween<double>(
          begin: 1,
          end: 2.6,
        ).animate(
          CurvedAnimation(
            parent: controllerScale,
            curve: const Interval(
              0,
              1,
              curve: Curves.easeOut,
            ),
          ),
        ),
        opacity = Tween<double>(
          begin: 1,
          end: 0.3,
        ).animate(
          CurvedAnimation(
            parent: controllerScale,
            curve: const Interval(
              0.6,
              1,
              curve: Curves.easeOut,
            ),
          ),
        );

  final Animation<double> rotate;
  final Animation<double> scale;
  final Animation<double> opacity;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controllerRotate,
      builder: (context, child) {
        return AnimatedBuilder(
          animation: controllerScale,
          builder: (context, child) {
            return Transform.rotate(
              angle: rotate.value,
              child: Transform.scale(
                scale: scale.value,
                child: Align(
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: opacity.value,
                    child: Image.asset('assets/images/ball.png'),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
