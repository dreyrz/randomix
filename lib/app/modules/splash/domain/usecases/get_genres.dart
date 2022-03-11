import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/usecase.dart';
import '../repositories/repository_interface.dart';

class GetGenres implements IUseCaseNoParams<List<String>> {
  final ISplashRepository _repository;

  GetGenres(this._repository);

  @override
  Future<Either<Failure, List<String>>> call() async {
    return await _repository.getGenres();
  }
}
