import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class UseCase<In, Out> {
  Future<Either<Failure, Out>> call(In params);
}

abstract class UseCaseNoParams<Out> {
  Future<Either<Failure, Out>> call();
}
