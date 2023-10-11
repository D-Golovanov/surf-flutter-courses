import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:surf_flutter_courses_template/05_magic/features/magic_ball/domain/repository/get_magic_text_repository.dart';
import 'package:surf_flutter_courses_template/05_magic/features/magic_ball/presentation/widgets/widgets.dart';

class MagicBallScreen extends StatefulWidget {
  final IGetTextRepository repository;

  const MagicBallScreen({super.key, required this.repository});

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen>
    with TickerProviderStateMixin {
  final duration300 = const Duration(milliseconds: 300);

  late AnimationController _controllerShpereRotate;
  late AnimationController _controllerShpereScale;
  late AnimationController _controllerHintOpacity;
  late AnimationController _controllerTextOpacity;

  late AnimationStatusListener listener;

  late Animation<double> _animationTextOpacityAndScale;

  bool isAnimate = false;
  bool isError = false;
  String? magicText;

  @override
  void initState() {
    _controllerShpereRotate = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _controllerShpereScale =
        AnimationController(duration: duration300, vsync: this);
    _controllerTextOpacity =
        AnimationController(duration: duration300, vsync: this);
    _controllerHintOpacity =
        AnimationController(duration: duration300, vsync: this);

    userAccelerometerEvents.listen(
      (UserAccelerometerEvent event) {
        if (event.x.abs() > 6 || event.y.abs() > 6 || event.z.abs() > 6) {
          if (!isAnimate) {
            _playAnimation();
          }
        }
      },
      onError: (error) {},
      cancelOnError: true,
    );

    listener = (status) {
      if (status == AnimationStatus.completed) {
        if (magicText == null) {
          _controllerShpereRotate.reset();
          _controllerShpereRotate.forward();
        }
      }
    };
    _controllerShpereRotate.addStatusListener(listener);

    _animationTextOpacityAndScale = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controllerTextOpacity,
        curve: const Interval(
          0,
          1,
          curve: Curves.easeInOut,
        ),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controllerShpereRotate.removeStatusListener(listener);
    _controllerShpereRotate.dispose();
    _controllerShpereScale.dispose();
    _controllerTextOpacity.dispose();
    _controllerHintOpacity.dispose();

    super.dispose();
  }

/*
  1. Нажать на шар / потрясти:
      блокировать колбеки (onTap / shake phone) > 

      анимация шара(rotate) / убрать подсказку(opacity) > 
      запрос текста (getMagicText) > 
      ответ получен / ошибка >
      "докрутить" шар до конца (если запрос прошел быстро) >
      убрать тень(position) / увеличить шар(scale) + прозрачность шара(opacity) > 

      показать текст(opacity) >
      --- задержка 3-4 сек --- >
      уменьшить шар(scale) + прозрачность шара(opacity) / показать тень(position) / показать подсказку(opacity) > 

      разблокировать колбеки (onTap / shake phone)
*/

  Future<void> _playAnimation() async {
    print('press ball');
    setState(() => isAnimate = true);

    _controllerHintOpacity.forward();
    await _controllerShpereRotate.forward();

    await widget.repository
        .getText()
        .then((value) => magicText = value)
        .onError((error, stackTrace) {
      isError = true;
      return magicText = error.toString();
    });

    await _controllerShpereScale.forward();
    await _controllerTextOpacity.forward();

    Future.delayed(const Duration(seconds: 2), () async {
      await _controllerTextOpacity.reverse();
      await _controllerShpereScale.reverse();
      await _controllerHintOpacity.reverse();
      _resetAnimation();
      setState(() => isAnimate = false);
    });
  }

  void _resetAnimation() {
    magicText = null;
    isError = false;
    _controllerShpereRotate.reset();
    _controllerShpereScale.reset();
    _controllerHintOpacity.reset();
    _controllerTextOpacity.reset();
  }

  @override
  Widget build(BuildContext context) {
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
            ShadowSphere(controller: _controllerHintOpacity),
            BottomHint(controller: _controllerHintOpacity),
            GestureDetector(
              onTap: isAnimate ? null : (_playAnimation),
              child: Sphere(
                context: context,
                controllerRotate: _controllerShpereRotate,
                controllerScale: _controllerShpereScale,
              ),
            ),
            Center(
              child: AnimatedBuilder(
                animation: _controllerTextOpacity,
                builder: (contex, child) => Opacity(
                  opacity: _animationTextOpacityAndScale.value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      magicText ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isError ? Colors.red : Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
