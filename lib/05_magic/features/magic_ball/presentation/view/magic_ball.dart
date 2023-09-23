import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/05_magic/features/magic_ball/data/repository/get_magic_text_impl.dart';

class MagicBall extends StatefulWidget {
  const MagicBall({super.key});

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> with TickerProviderStateMixin {
  final _repo = GetMagicTextImpl();
  String magicText = '';
  late AnimationController _animationController;
  late AnimationController _animationControllerScale;

  late Animation<double> _animationRotate;
  late Animation<double> _animationScale;
  late Animation<double> _animationOpacity;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _animationControllerScale = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    _animationRotate = Tween<double>(
      begin: 0,
      end: 6.28,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          1,
          curve: Curves.linear,
        ),
      ),
    );
    _animationScale = Tween<double>(
      begin: 1,
      end: 2.6,
    ).animate(
      CurvedAnimation(
        // parent: _animationController,
        parent: _animationControllerScale,
        curve: const Interval(
          // 0.7,
          0,
          1,
          curve: Curves.easeOut,
        ),
      ),
    );
    _animationOpacity = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.5,
          curve: Curves.easeInOut,
        ),
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerScale.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    // try {
    //   _animationController.status != AnimationStatus.completed
    //       ? await _animationController.forward().orCancel
    //       : await _animationController.reverse().orCancel;
    // } on TickerCanceled {}
    try {
      if (_animationController.status != AnimationStatus.completed) {
        await _animationController.forward().orCancel;
        await _animationControllerScale.forward().orCancel;
      } else {
        await _animationControllerScale.reverse().orCancel;
        await _animationController.reverse().orCancel;
      }
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF100C2C),
            Color(0xFF000002),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              top: screenSize.height / 2 + screenSize.width / 2 - 20,
              left: 0,
              right: 0,
              child: Image.asset('assets/images/ball_shadow.png'),
            ),
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) => Opacity(
                  opacity: _animationOpacity.value,
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
            ),
            GestureDetector(
              onTap: (_playAnimation),
              child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return AnimatedBuilder(
                      animation: _animationControllerScale,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _animationRotate.value,
                          child: Transform.scale(
                            scale: _animationScale.value,
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset('assets/images/ball.png'),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: FutureBuilder(
                  future: _repo.getMagicText(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w400,
                          height: 1,
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
