import 'package:dartz/dartz.dart';
import 'package:randomix/app/core/utils/usecase.dart';

import '../../../../core/errors/failure.dart';

import '../entities/track.dart';
import '../repositories/repository_interface.dart';

class GetRandomTrackByGenre implements IUseCase<String, Track> {
  final IHomeRepository _repository;

  GetRandomTrackByGenre(this._repository);
  @override
  Future<Either<Failure, Track>> call(String genre) async {
    return await _repository.getRandomTrackByGenre(genre);
  }
}
