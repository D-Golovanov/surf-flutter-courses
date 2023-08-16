import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/data/models/colors_grid_model.dart';

abstract interface class ColorBoxRepository {
  Future<ColorsBoxGridModel> getColorBoxes();
}
