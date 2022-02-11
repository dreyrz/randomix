import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class IUseCase<In, Out> {
  Future<Either<Failure, Out>> call(In params);
}

class NoParams {}
