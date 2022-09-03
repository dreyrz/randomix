import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/config/config.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api.dart';
import '../../../../core/utils/usecase.dart';
import '../repositories/repository_interface.dart';

class GetToken implements IUseCaseNoParams<String> {
  final ISplashRepository _repository;
  final IApi _api;
  GetToken(this._repository, this._api);

  @override
  Future<Either<Failure, String>> call() {
    getBase64ClientIdAndSecret();
    return _repository.getToken();
  }

  void getBase64ClientIdAndSecret() {
    String url = "${Config.clientId}:${Config.clientSecret}";
    _api.baseUrl = Config.authBaseUrl;
    _api.headers = {
      "Authorization": "Basic ${base64.encode(utf8.encode(url))}"
    };
    _api.contentType =
        ContentType.parse("application/x-www-form-urlencoded").toString();
  }
}
