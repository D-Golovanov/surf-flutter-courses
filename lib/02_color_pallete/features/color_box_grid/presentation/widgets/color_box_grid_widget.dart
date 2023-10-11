import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/data/models/colors_grid_model.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/presentation/widgets/color_box_cell_widget.dart';

class ColorBoxGridWidget extends StatelessWidget {
  final ColorsBoxGridModel colorBoxGrid;

  const ColorBoxGridWidget({super.key, required this.colorBoxGrid});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 16, top: 40, right: 16),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          crossAxisCount: 3,
          mainAxisExtent: 180,
        ),
        itemCount: colorBoxGrid.colorsList.length,
        itemBuilder: (context, index) => ColorBoxCellWidget(
          colorBox: colorBoxGrid.colorsList[index],
        ),
      ),
    );
  }
}
