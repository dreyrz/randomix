import '../../../../core/error/failure.dart';

abstract class NoInternetConenction extends Failure {
  NoInternetConenction() : super(message: 'No internet connection');
}

class TrackNoInternetConnection extends NoInternetConenction {}

class TrackError extends Failure {
  TrackError(
    StackTrace? stackTrace,
    String? label,
    dynamic exception,
    String message,
  ) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
          message: message,
        );
}
