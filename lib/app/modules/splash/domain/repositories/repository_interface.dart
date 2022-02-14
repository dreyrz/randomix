import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class ISplashRepository {
  Future<Either<Failure, String>> getToken();
}
