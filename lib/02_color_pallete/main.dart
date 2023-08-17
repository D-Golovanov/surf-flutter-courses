import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/color_pallete_app.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/data/repository/color_box_impl.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/data/source/color_box_local_data_source.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/domain/repository/color_box_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final localDataSource = ColorBoxLocalDataSourceImpl();

  GetIt.I.registerSingleton<ColorBoxRepository>(
      ColorBoxRepositoryImpl(data: localDataSource));

  runApp(const ColorPalleteApp());
}
