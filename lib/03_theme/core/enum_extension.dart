import 'package:surf_flutter_courses_template/03_theme/features/profile/data/models/theme_model.dart';

extension CurrentThemeExtensionOnEnum on AppThemeMode {
  String get currentThemeString => switch (this) {
        AppThemeMode.system => 'system',
        AppThemeMode.light => 'light',
        AppThemeMode.dark => 'dark',
      };
}

extension CurrentThemeExtensionOnString on String {
  AppThemeMode? get currentThemeEnum => switch (this) {
        'system' => AppThemeMode.system,
        'light' => AppThemeMode.light,
        'dark' => AppThemeMode.dark,
        _ => AppThemeMode.system,
      };
}

extension CurrentSchemeExtensionOnEnum on AppSchemeMode {
  String get currentSchemeString => switch (this) {
        AppSchemeMode.green => 'green',
        AppSchemeMode.blue => 'blue',
        AppSchemeMode.orange => 'orange',
      };
}

extension CurrentSchemeExtensionOnString on String {
  AppSchemeMode? get currentSchemeEnum => switch (this) {
        'green' => AppSchemeMode.green,
        'blue' => AppSchemeMode.blue,
        'orange' => AppSchemeMode.orange,
        _ => AppSchemeMode.green,
      };
}
