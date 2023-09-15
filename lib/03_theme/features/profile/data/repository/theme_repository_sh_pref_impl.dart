import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/domain/repository/theme_repository.dart';

class ThemeRepositoryShPrefImpl implements IThemeRepository {
  @override
  Future<String> getTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('theme') ?? 'system';
    } catch (e) {
      print(e.toString());
      return 'system';
    }
  }

  @override
  Future<void> setTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', theme);
  }
}
