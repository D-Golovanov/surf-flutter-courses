import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/domain/repository/theme_repository.dart';

class ThemeRepositoryShPrefImpl implements IThemeRepository {
  final SharedPreferences pref;

  ThemeRepositoryShPrefImpl({required this.pref});

  @override
  Future<String> getTheme() async {
    return pref.getString('theme') ?? 'system';
  }

  @override
  Future<void> setTheme(String theme) async {
    pref.setString('theme', theme);
  }

  @override
  Future<String> getScheme() async {
    return pref.getString('scheme') ?? 'green';
  }

  @override
  Future<void> setScheme(String scheme) async {
    pref.setString('scheme', scheme);
  }
}
