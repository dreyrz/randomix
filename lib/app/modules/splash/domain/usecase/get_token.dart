import 'dart:convert';

import 'package:randomix/app/core/error/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/config/config.dart';
import '../../../../core/usecase/usecase.dart';

import '../repositories/splash_repository_interface.dart';

class GetToken implements IUseCase<NoParams, String> {
  final ISplashRepository _repository;

  GetToken(this._repository);
  @override
  Future<Either<Failure, String>> call(NoParams params) {
    return _repository.getToken(_getBase64ClientIdAndSecret());
  }

  String _getBase64ClientIdAndSecret() {
    String url = "${Config.clientId}:${Config.clientSecret}";

    return base64.encode(utf8.encode(url));
  }
}
