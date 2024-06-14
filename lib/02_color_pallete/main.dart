import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/color_pallete_app.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/data/repository/color_box_repository_impl.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/data/source/color_box_local_data_source.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/domain/repository/color_box_repository.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/copy/data/copy_repository_impl.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/copy/domain/copy_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final localDataSource = ColorBoxLocalDataSourceImpl();

  GetIt.I.registerSingleton<IColorBoxRepository>(
      ColorBoxRepositoryImpl(data: localDataSource));

  GetIt.I.registerSingleton<ICopyRepository>(CopyRepositoryImpl());

  runApp(const ColorPalleteApp());
}
