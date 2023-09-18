abstract interface class IThemeRepository {
  Future<String> getTheme();
  Future<void> setTheme(String theme);
  Future<String> getScheme();
  Future<void> setScheme(String scheme);
}
