import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_detail/presentation/view/detail_color.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/data/models/color_box_model.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/presentation/bloc/color_box_grid_bloc.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/copy/presentation/bloc/copy_bloc.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/utils/get_int_color.dart';

class ColorBoxCellWidget extends StatefulWidget {
  final ColorBoxModel colorBox;

  const ColorBoxCellWidget({
    super.key,
    required this.colorBox,
  });

  @override
  State<ColorBoxCellWidget> createState() => _ColorBoxCellWidgetState();
}

class _ColorBoxCellWidgetState extends State<ColorBoxCellWidget> {
  late Timer _timer;
  double _scaleWidget = 1.0;

  void _pressStart(LongPressStartDetails details) {
    _timer = Timer.periodic(const Duration(milliseconds: 60), (timer) {
      setState(() {
        _scaleWidget = _scaleWidget - 0.01;
        if (_scaleWidget < 0.9) {
          _timer.cancel();
        }
      });
    });
  }

  void _pressEnd(LongPressEndDetails details) {
    _timer.cancel();
    setState(() => _scaleWidget = 1.0);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: _pressStart,
      onLongPressEnd: _pressEnd,
      onLongPress: () => context
          .read<CopyBloc>()
          .add(CopyValueEvent(value: widget.colorBox.hex)),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailColor(
            colorBox: widget.colorBox,
          ),
        ),
      ),
      child: Transform.scale(
        scale: _scaleWidget,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _RectangleColor(hex: widget.colorBox.hex),
            const SizedBox(height: 8),
            _TitleAndHex(
              title: widget.colorBox.title,
              hex: widget.colorBox.hex,
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleAndHex extends StatelessWidget {
  const _TitleAndHex({
    required this.title,
    required this.hex,
  });

  final String title;
  final String hex;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$title\n$hex',
      style: const TextStyle(
        color: Color(0xFF252838),
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 16 / 12,
      ),
    );
  }
}

class _RectangleColor extends StatelessWidget {
  const _RectangleColor({
    required this.hex,
  });

  final String hex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Color(getIntColor(hex)),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
    );
  }
}
