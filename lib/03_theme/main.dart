import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/data/repository/theme_repository_sh_pref_impl.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/domain/repository/theme_repository.dart';
import 'package:surf_flutter_courses_template/03_theme/theme_change_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();

  GetIt.I.registerSingleton<IThemeRepository>(
      ThemeRepositoryShPrefImpl(pref: pref));

  runApp(const ThemeChangeApp());
}
