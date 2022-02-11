import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class ISplashRepository {
  Future<Either<Failure, String>> getToken(String base64clientIdAndSecret);
}
