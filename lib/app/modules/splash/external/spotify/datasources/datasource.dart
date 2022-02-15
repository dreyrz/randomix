import 'package:dio/dio.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/api.dart';
import '../../../domain/errors/errors.dart';
import '../../../infra/datasources/splash_datasource_interface.dart';

class SplashDatasource implements ISplashDatasource {
  final IApi _api;
  SplashDatasource(this._api);
  @override
  Future<String> getToken() async {
    try {
      final response =
          await _api.post('', data: {"grant_type": "client_credentials"});
      return response.data["access_token"];
    } on DioError catch (e, stackTrace) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw SplashNoInternetConnection('getRandomTrackByGenre');
      } else {
        throw SplashError(
          stackTrace,
          'HomeDataSource getRandomTrackByGenre',
          e,
          e.toString(),
        );
      }
    } catch (e, stackTrace) {
      throw UnknownError(e, stackTrace);
    }
  }
}
