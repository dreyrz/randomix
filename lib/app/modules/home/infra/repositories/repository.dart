import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/track.dart';
import '../../domain/repositories/repository_interface.dart';
import '../datasources/home_datasource_interface.dart';

class HomeRepository implements IHomeRepository {
  final IHomeDatasource _datasource;

  HomeRepository(this._datasource);

  @override
  Future<Either<Failure, Track>> getRandomTrackByGenre(String genre) async {
    try {
      final result = await _datasource.getRandomTrackByGenre(genre);
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
