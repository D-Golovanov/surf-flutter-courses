import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:surf_flutter_courses_template/03_theme/core/theme/theme.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/domain/repository/theme_repository.dart';

enum AppThemeMode { system, light, dark }

enum AppSchemeMode { green, blue, orange }

class ThemeModel extends ChangeNotifier {
  final IThemeRepository _themeRepository;

  ThemeModel(this._themeRepository);

  AppThemeMode _theme = AppThemeMode.system;
  AppSchemeMode _scheme = AppSchemeMode.green;

  AppThemeMode get theme => _theme;
  AppSchemeMode get scheme => _scheme;

  Future<void> setTheme(AppThemeMode newTheme) async {
    _theme = newTheme;
    await _themeRepository.setTheme(_theme);
    notifyListeners();
  }

  Future<void> setScheme(AppSchemeMode newScheme) async {
    if (newScheme == _scheme) return;

    _scheme = newScheme;
    await _themeRepository.setScheme(_scheme);
    notifyListeners();
  }

  ThemeData getThemeData() {
    Brightness brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;

    switch (_theme) {
      case AppThemeMode.system:
        _scheme = AppSchemeMode.green;
        break;
      case AppThemeMode.light:
        brightness = Brightness.light;
      case AppThemeMode.dark:
        brightness = Brightness.dark;
    }

    final schemeColor = switch (_scheme) {
      AppSchemeMode.green => GreenSchemeColor(),
      AppSchemeMode.blue => BlueSchemeColor(),
      AppSchemeMode.orange => OrangeSchemeColor()
    };

    return switch (brightness) {
      Brightness.light => AppTheme(scheme: schemeColor).ligthThemeData,
      Brightness.dark => AppTheme(scheme: schemeColor).darkThemeData
    };
  }

  Future<void> loadFromCache() async {
    final theme = await _themeRepository.getTheme();
    final scheme = await _themeRepository.getScheme();

    setTheme(theme);
    setScheme(scheme);
  }

  Future<void> setSystemThemeFromBrightness() async {
    if (_theme == AppThemeMode.system) {
      setTheme(_theme);
    }
  }

  String getTextTheme() => switch (_theme) {
        AppThemeMode.system => 'Системная',
        AppThemeMode.light => 'Светлая',
        AppThemeMode.dark => 'Темная',
      };
}
