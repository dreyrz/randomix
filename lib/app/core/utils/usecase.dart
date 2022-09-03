import 'dart:async';

import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class IUseCase {}

abstract class IUseCaseParams<In, Out> extends IUseCase {
  FutureOr<Either<Failure, Out>> call(In params);
}

abstract class IUseCaseNoParams<Out> extends IUseCase {
  FutureOr<Either<Failure, Out>> call();
}
