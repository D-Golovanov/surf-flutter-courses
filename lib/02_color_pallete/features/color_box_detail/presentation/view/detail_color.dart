import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_detail/presentation/widgets/widgets.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/data/models/color_box_model.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/utils/get_int_color.dart';

class DetailColor extends StatelessWidget {
  final ColorBoxModel colorBox;

  const DetailColor({super.key, required this.colorBox});

  @override
  Widget build(BuildContext context) {
    final colorInt = getIntColor(colorBox.hex);
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
                  TitleColorWidget(title: colorBox.title),
                  const SizedBox(height: 16.0),
                  ContainerValueColorWidget(title: 'Hex', color: colorBox.hex),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContainerValueColorWidget(
                          title: 'Red', color: '${Color(colorInt).red}'),
                      ContainerValueColorWidget(
                          title: 'Green', color: '${Color(colorInt).green}'),
                      ContainerValueColorWidget(
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
