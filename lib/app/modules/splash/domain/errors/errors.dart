import '../../../../core/error/failure.dart';

class SplashNoInternetConnection extends NoInternetConnection {}

class SplashError extends Failure {
  SplashError(
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
