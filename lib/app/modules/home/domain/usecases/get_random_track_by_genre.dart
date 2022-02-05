import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/track.dart';
import '../errors/errors.dart';
import '../repositories/home_repository.dart';

abstract class IGetRandomTrackByGenre {
  Future<Either<Failure, Track>> call(String genre);
}

class GetRandomTrackByGenre implements IGetRandomTrackByGenre {
  final HomeRepository repository;

  GetRandomTrackByGenre({required this.repository});
  @override
  Future<Either<Failure, Track>> call(String genre) async {
    return await repository.getRandomTrackByGenre(genre);
  }
}
