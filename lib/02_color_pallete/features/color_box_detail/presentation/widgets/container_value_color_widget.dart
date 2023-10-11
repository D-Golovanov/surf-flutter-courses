import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/copy/presentation/bloc/copy_bloc.dart';

class ContainerValueColorWidget extends StatelessWidget {
  final String title;
  final String color;

  const ContainerValueColorWidget({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<CopyBloc>().add(CopyValueEvent(value: color)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1437394A),
              blurRadius: 12,
              offset: Offset(0, 12),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Color(0xFF252838), fontSize: 16, height: 24 / 16),
            ),
            const SizedBox(width: 8.0),
            Text(
              color.replaceAll('#', ''),
              style: const TextStyle(
                  color: Color(0xFF252838), fontSize: 16, height: 24 / 16),
            )
          ],
        ),
      ),
    );
  }
}
