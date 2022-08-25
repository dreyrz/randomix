import 'dart:developer';

import 'package:dartz/dartz.dart';
import '../../../../core/entities/_entities.dart';
import '../../../../core/errors/failure.dart';

import '../../domain/errors/errors.dart';
import '../../domain/repositories/repository_interface.dart';
import '../datasources/home_datasource_interface.dart';

class HomeRepository implements IHomeRepository {
  final IHomeDatasource _datasource;

  HomeRepository(this._datasource);

  @override
  Future<Either<Failure, Track>> getRandomTrackByGenre(String genre) async {
    try {
      final result = await _datasource.getRandomTrackByGenre(genre);
      log(result.toString());
      if (result.isInvalid) {
        throw TrackError('Invalid track', null, 'getRandomTrackByGenre', null);
      }
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
