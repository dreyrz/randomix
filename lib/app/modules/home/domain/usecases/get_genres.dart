import 'package:dartz/dartz.dart';
import 'package:randomix/app/core/utils/usecase.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/repository_interface.dart';

class GetGenres implements IUseCaseNoParams<List<String>> {
  final IHomeRepository _repository;

  GetGenres(this._repository);

  @override
  Future<Either<Failure, List<String>>> call() async {
    return await _repository.getGenres();
  }
}
