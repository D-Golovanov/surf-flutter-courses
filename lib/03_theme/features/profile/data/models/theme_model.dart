import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_courses_template/03_theme/core/theme/theme.dart';

class ThemeModel extends ChangeNotifier {
  String _theme = 'system';
  String _scheme = 'green';

  late SharedPreferences _pref;

  Future<void> getThemePref() async {
    _pref = await SharedPreferences.getInstance();
    _theme = _pref.getString('theme') ?? _theme;
    _scheme = _pref.getString('scheme') ?? _scheme;
    notifyListeners();
  }

  Future<void> setThemePref(String theme) async {
    _pref = await SharedPreferences.getInstance();
    _pref.setString('theme', theme);
  }

  Future<void> setSchemePref(String scheme) async {
    _pref = await SharedPreferences.getInstance();
    _pref.setString('scheme', scheme);
  }

  setTheme(String newTheme) {
    _theme = newTheme;
    setThemePref(newTheme);
    notifyListeners();
  }

  setScheme(String newScheme) {
    _scheme = newScheme;
    setSchemePref(newScheme);
    notifyListeners();
  }

  String getTheme() => _theme;
  String getScheme() => _scheme;

  String getTextTheme() => switch (_theme) {
        'system' => 'Системная',
        'light' => 'Светлая',
        'dark' => 'Темная',
        _ => 'Error',
      };

  ThemeData getThemeData() {
    switch (_theme) {
      case 'system':
        switch (
            SchedulerBinding.instance.platformDispatcher.platformBrightness) {
          case Brightness.light:
            return AppTheme(scheme: GreenSchemeColor()).ligthThemeData;
          case Brightness.dark:
            return AppTheme(scheme: GreenSchemeColor()).darkThemeData;
        }

      case 'light':
        switch (_scheme) {
          case 'green':
            return AppTheme(scheme: GreenSchemeColor()).ligthThemeData;
          case 'blue':
            return AppTheme(scheme: BlueSchemeColor()).ligthThemeData;
          case 'orange':
            return AppTheme(scheme: OrangeSchemeColor()).ligthThemeData;
        }
      case 'dark':
        switch (_scheme) {
          case 'green':
            return AppTheme(scheme: GreenSchemeColor()).darkThemeData;
          case 'blue':
            return AppTheme(scheme: BlueSchemeColor()).darkThemeData;
          case 'orange':
            return AppTheme(scheme: OrangeSchemeColor()).darkThemeData;
        }
    }
    return AppTheme(scheme: GreenSchemeColor()).ligthThemeData;
  }
}

enum CurrentTheme { system, light, dark }

extension CurrentThemeExtensionOnEnum on CurrentTheme {
  String get currentThemeString => switch (this) {
        CurrentTheme.system => 'system',
        CurrentTheme.light => 'light',
        CurrentTheme.dark => 'dark',
      };
}

extension CurrentThemeExtensionOnString on String {
  CurrentTheme? get currentThemeEnum => switch (this) {
        'system' => CurrentTheme.system,
        'light' => CurrentTheme.light,
        'dark' => CurrentTheme.dark,
        _ => CurrentTheme.system,
      };
}

enum CurrentScheme { green, blue, orange }

extension CurrentSchemeExtensionOnEnum on CurrentScheme {
  String get currentSchemeString => switch (this) {
        CurrentScheme.green => 'green',
        CurrentScheme.blue => 'blue',
        CurrentScheme.orange => 'orange',
      };
}

extension CurrentSchemeExtensionOnString on String {
  CurrentScheme? get currentSchemeEnum => switch (this) {
        'green' => CurrentScheme.green,
        'blue' => CurrentScheme.blue,
        'orange' => CurrentScheme.orange,
        _ => CurrentScheme.green,
      };
}
