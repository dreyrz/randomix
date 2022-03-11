import '../../../../core/errors/failure.dart';

class SplashNoInternetConnection extends NoInternetConnection {
  SplashNoInternetConnection(String label) : super(label);
}

class SplashError extends Failure {
  SplashError(
    StackTrace? stackTrace,
    String label,
    dynamic exception,
    String message,
  ) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
          message: message,
        );
}

class GetGenresError extends Failure {
  GetGenresError(
    dynamic exception,
    StackTrace? stackTrace,
    String label,
    String message,
  ) : super(
          stackTrace: stackTrace,
          label: "GetGenresError $label",
          exception: exception,
          message: message,
        );
}
