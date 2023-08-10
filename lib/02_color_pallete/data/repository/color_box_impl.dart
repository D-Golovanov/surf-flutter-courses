import 'dart:convert';

import 'package:surf_flutter_courses_template/02_color_pallete/data/models/colors_list_model.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/data/source/color_box_local_data_source.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/domain/repository/color_box_repository.dart';

class ColorBoxRepositoryImpl implements ColorBoxRepository {
  final ColorBoxLocalDataSourceImpl data;

  ColorBoxRepositoryImpl({required this.data});

  @override
  Future<ColorsListModel> getColorBoxes() async {
    try {
      //получение данных из json файла в ассетах
      final colorsForAssets = await data.getAssetsFile();

      final responseColorsList =
          json.decode(colorsForAssets) as Map<String, dynamic>;

      final sortColorsList = (responseColorsList['colors'] as List<dynamic>)
          .map((e) => (e as Map<String, dynamic>))
          .where((element) => element.containsKey('value'))
          .toList();

      final response = ColorsListModel.fromJSON(sortColorsList);
      return response;
    } catch (e) {
      throw Exception('Ooops...');
    }
  }
}
