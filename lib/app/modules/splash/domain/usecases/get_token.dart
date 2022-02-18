import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/config/config.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api.dart';
import '../../../../core/utils/interfaces/usecase.dart';
import '../repositories/repository_interface.dart';

class GetToken implements IUseCaseNoParams<String> {
  final ISplashRepository _repository;

  GetToken(this._repository);

  @override
  Future<Either<Failure, String>> call() {
    getBase64ClientIdAndSecret();
    return _repository.getToken();
  }

  void getBase64ClientIdAndSecret() {
    final api = Get.find<IApi>();
    String url = "${Config.clientId}:${Config.clientSecret}";
    api.baseUrl = Config.authBaseUrl;
    api.headers = {"Authorization": "Basic ${base64.encode(utf8.encode(url))}"};
    api.contentType =
        ContentType.parse("application/x-www-form-urlencoded").toString();
  }
}
