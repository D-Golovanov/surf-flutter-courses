import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/domain/entities/color_box.dart';

class ColorBoxModel extends ColorBoxEntity {
  const ColorBoxModel({
    required super.title,
    required super.hex,
  });

  factory ColorBoxModel.fromJSON(Map<String, dynamic> json) {
    return ColorBoxModel(
      title: json['name'],
      hex: json['value'],
    );
  }

  @override
  String toString() => '$title: $hex';
}
