import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/color_pallete_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // GetIt.I.registerSingleton();

  runApp(const ColorPalleteApp());
}
