import '../../../../core/errors/failure.dart';

class TrackNoInternetConnection extends NoInternetConnection {
  TrackNoInternetConnection(String label) : super(label);
}

class TrackError extends Failure {
  TrackError(
    dynamic exception,
    StackTrace? stackTrace,
    String label,
    String? message,
  ) : super(
          stackTrace: stackTrace,
          label: "TrackError $label",
          exception: exception,
          message: message,
        );
}
