import 'dart:io';

import 'package:dio/dio.dart';
import 'package:randomix/app/core/error/failure.dart';
import 'package:randomix/app/modules/splash/infra/datasources/splash_datasource_interface.dart';

import '../../../../../core/api/api.dart';
import '../../../../../core/config/config.dart';
import '../../../domain/errors/errors.dart';

class SplashDatasource implements ISplashDatasource {
  final IApi _api;
  SplashDatasource(this._api);
  @override
  Future<String> getToken(String base64clientIdAndSecret) async {
    try {
      _api.baseUrl = Config.authBaseUrl;
      _api.headers = {"Authorization": "Basic $base64clientIdAndSecret"};
      _api.contentType =
          ContentType.parse("application/x-www-form-urlencoded").toString();
      final response =
          await _api.post('', data: {"grant_type": "client_credentials"});

      return response.data["access_token"];
    } on DioError catch (e, stackTrace) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw SplashNoInternetConnection();
      } else {
        throw SplashError(
          stackTrace,
          'HomeDataSource getRandomTrackByGenre',
          e,
          e.toString(),
        );
      }
    } catch (e) {
      throw UnknownError();
    }
  }
}
