import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/repository_interface.dart';
import '../datasources/splash_datasource_interface.dart';

class SplashRepository implements ISplashRepository {
  final ISplashDatasource _datasource;

  SplashRepository(this._datasource);

  @override
  Future<Either<Failure, String>> getToken(
      String base64clientIdAndSecret) async {
    try {
      final result = await _datasource.getToken(base64clientIdAndSecret);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on Exception catch (exception, stackTrace) {
      return Left(UnknownError(
        exception: exception,
        stackTrace: stackTrace,
        label: 'homeRepository getRandomTrackByGenre',
      ));
    }
  }
}
