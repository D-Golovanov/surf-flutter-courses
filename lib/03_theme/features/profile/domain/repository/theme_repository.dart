abstract interface class IThemeRepository {
  Future<String> getTheme();
  Future<void> setTheme(String theme);
}
