import 'package:surf_flutter_courses_template/02_color_pallete/data/models/color_box_model.dart';

class ColorsListModel {
  final List<ColorBoxModel> colorsList;

  const ColorsListModel({required this.colorsList});

  factory ColorsListModel.fromJSON(List<Map<String, dynamic>> json) {
    return ColorsListModel(
      colorsList: json.map((e) => ColorBoxModel.fromJSON(e)).toList(),
    );
  }

  @override
  String toString() => '$colorsList';
}
