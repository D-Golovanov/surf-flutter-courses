/// Interface describing the logic for retrieving random text
abstract interface class IGetTextRepository {
  /// Get random text from API
  Future<String> getText();
}
