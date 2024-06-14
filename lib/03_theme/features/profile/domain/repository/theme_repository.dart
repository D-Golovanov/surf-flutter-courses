import 'package:surf_flutter_courses_template/03_theme/features/profile/data/models/theme_model.dart';

/// Interface, which describes logic for
/// handling themes and schemes of an app.
abstract interface class IThemeRepository {
  /// Get currently saved theme.
  ///
  /// Options are: 'system', 'light', 'dark'
  Future<AppThemeMode> getTheme();

  /// Saves given theme mode in cache.
  ///
  /// This value would be automatically loaded later on.
  Future<void> setTheme(AppThemeMode theme);

  /// Get currently saved theme.
  ///
  /// Options are: 'green', 'blue', 'orange'
  Future<AppSchemeMode> getScheme();

  /// Saves given scheme mode in cache.
  ///
  /// This value would be automatically loaded later on.
  Future<void> setScheme(AppSchemeMode scheme);
}
