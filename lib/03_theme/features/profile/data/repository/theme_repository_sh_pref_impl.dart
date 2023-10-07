import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_courses_template/03_theme/core/enum_extension.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/data/models/theme_model.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/domain/repository/theme_repository.dart';

class ThemeRepositoryShPrefImpl implements IThemeRepository {
  final SharedPreferences pref;

  ThemeRepositoryShPrefImpl({required this.pref});

  @override
  Future<AppThemeMode> getTheme() async {
    return pref.getString('theme')?.currentThemeEnum ?? AppThemeMode.system;
  }

  @override
  Future<void> setTheme(AppThemeMode theme) async {
    pref.setString('theme', theme.currentThemeString);
  }

  @override
  Future<AppSchemeMode> getScheme() async {
    return pref.getString('scheme')?.currentSchemeEnum ?? AppSchemeMode.green;
  }

  @override
  Future<void> setScheme(AppSchemeMode scheme) async {
    pref.setString('scheme', scheme.currentSchemeString);
  }
}
