import 'package:surf_flutter_courses_template/02_color_pallete/data/models/colors_list_model.dart';

abstract interface class ColorBoxRepository {
  Future<ColorsListModel> getColorBoxes();
}
