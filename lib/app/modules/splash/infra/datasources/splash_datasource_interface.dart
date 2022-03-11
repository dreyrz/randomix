abstract class ISplashDatasource {
  Future<String> getToken();
  Future<List<String>> getGenres();
}
