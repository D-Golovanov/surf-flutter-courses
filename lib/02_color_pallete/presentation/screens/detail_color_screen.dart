import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/color_box.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/main.dart';

class DetailColorScreen extends StatelessWidget {
  final ColorBox colorBox;

  const DetailColorScreen({super.key, required this.colorBox});

  @override
  Widget build(BuildContext context) {
    final colorInt = int.parse('0xFF${colorBox.hex.replaceAll('#', '')}');
    final appBarHeight = MediaQuery.of(context).size.height / 2;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(colorInt),
            expandedHeight: appBarHeight,
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 16, top: 32, right: 16),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    colorBox.title,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.6,
                      height: 34.0 / 30.0,
                      color: Color(0xFF252838),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ContainerColorWidget(title: 'Hex', color: colorBox.hex),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContainerColorWidget(
                          title: 'Red', color: '${Color(colorInt).red}'),
                      ContainerColorWidget(
                          title: 'Green', color: '${Color(colorInt).green}'),
                      ContainerColorWidget(
                          title: 'Blue', color: '${Color(colorInt).blue}'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerColorWidget extends StatelessWidget {
  final String title;
  final String color;

  const ContainerColorWidget({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => copyClipBoard(context: context, value: color),
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
