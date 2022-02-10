import 'package:dartz/dartz.dart';
import 'package:randomix/app/core/usecase/usecase.dart';

import '../../../../core/error/failure.dart';

import '../entities/track.dart';
import '../repositories/home_repository_interface.dart';

class GetRandomTrackByGenre implements UseCase<String, Track> {
  final IHomeRepository _repository;

  GetRandomTrackByGenre(this._repository);
  @override
  Future<Either<Failure, Track>> call(String genre) async {
    return await _repository.getRandomTrackByGenre(genre);
  }
}
