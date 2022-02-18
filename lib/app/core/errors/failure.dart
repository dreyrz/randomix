import 'dart:developer';

abstract class Failure implements Exception {
  Failure({
    StackTrace? stackTrace,
    required String label,
    dynamic exception,
    String? message,
  }) {
    log(
      message ?? '',
      name: label,
      stackTrace: stackTrace,
      error: exception.toString(),
    );
  }
}

abstract class NoInternetConnection extends Failure {
  NoInternetConnection(String label)
      : super(label: label, message: 'No internet connection');
}

class UnknownError extends Failure {
  UnknownError(
    dynamic exception,
    StackTrace? stackTrace,
  ) : super(
          label: 'Unknown error',
          stackTrace: stackTrace,
          exception: exception,
        );
}
