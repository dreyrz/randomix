import '../../../../core/error/failure.dart';
import '../../domain/entities/track.dart';

abstract class HomeState {}

class InitialState implements HomeState {
  const InitialState();
}

class LoadingState implements HomeState {
  const LoadingState();
}

class ErrorState implements HomeState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState implements HomeState {
  final Track track;
  const SuccessState(this.track);
}
