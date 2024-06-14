import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/data/models/color_box_model.dart';

class ColorsBoxGridModel {
  final List<ColorBoxModel> colorsList;

  const ColorsBoxGridModel({required this.colorsList});

  factory ColorsBoxGridModel.fromJSON(List<Map<String, dynamic>> json) {
    return ColorsBoxGridModel(
      colorsList: json.map((e) => ColorBoxModel.fromJSON(e)).toList(),
    );
  }

  @override
  String toString() => '$colorsList';
}
