import 'dart:convert';

import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/data/models/colors_grid_model.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/data/source/color_box_local_data_source.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/domain/repository/color_box_repository.dart';

class ColorBoxRepositoryImpl implements ColorBoxRepository {
  final ColorBoxLocalDataSourceImpl data;

  ColorBoxRepositoryImpl({required this.data});

  @override
  Future<ColorsBoxGridModel> getColorBoxes() async {
    try {
      // получение данных из json файла в ассетах
      final colorsForAssets = await data.getAssetsFile();

      // проверить загрузку
      await Future.delayed(const Duration(seconds: 3));

      final responseColorsList =
          json.decode(colorsForAssets) as Map<String, dynamic>;

      final sortColorsList = (responseColorsList['colors'] as List<dynamic>)
          .map((e) => (e as Map<String, dynamic>))
          .where((element) => element.containsKey('value'))
          .toList();

      final response = ColorsBoxGridModel.fromJSON(sortColorsList);
      return response;
    } on Exception catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
