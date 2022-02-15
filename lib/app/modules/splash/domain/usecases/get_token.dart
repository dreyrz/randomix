import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../core/config/config.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/repository_interface.dart';

class GetToken implements UseCaseNoParams<String> {
  final ISplashRepository _repository;

  GetToken(this._repository);

  @override
  Future<Either<Failure, String>> call() {
    return _repository.getToken(getBase64ClientIdAndSecret());
  }

  String getBase64ClientIdAndSecret() {
    String url = "${Config.clientId}:${Config.clientSecret}";

    return base64.encode(utf8.encode(url));
  }
}
