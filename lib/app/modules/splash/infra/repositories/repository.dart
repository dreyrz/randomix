import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/repositories/repository_interface.dart';
import '../datasources/splash_datasource_interface.dart';

class SplashRepository implements ISplashRepository {
  final ISplashDatasource _datasource;

  SplashRepository(this._datasource);

  @override
  Future<Either<Failure, String>> getToken() async {
    try {
      final result = await _datasource.getToken();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on Exception catch (exception, stackTrace) {
      return Left(UnknownError(
        exception,
        stackTrace,
      ));
    }
  }
}
