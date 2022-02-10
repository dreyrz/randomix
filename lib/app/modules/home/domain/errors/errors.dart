import '../../../../core/error/failure.dart';

class TrackNoInternetConnection extends NoInternetConnection {}

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
