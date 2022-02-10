abstract class ISplashDatasource {
  Future<String> getToken(String base64clientIdAndSecret);
}
