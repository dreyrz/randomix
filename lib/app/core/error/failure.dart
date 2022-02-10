import 'dart:developer';

abstract class Failure {
  final String message;

  Failure({
    StackTrace? stackTrace,
    String? label,
    dynamic exception,
    this.message = '',
  }) {
    log(
      message,
      name: label!,
      stackTrace: stackTrace,
      error: exception.toString(),
    );
  }
}

abstract class NoInternetConnection extends Failure {
  NoInternetConnection() : super(message: 'No internet connection');
}

class UnknownError extends Failure {
  final String errorMessage;
  final dynamic exception;
  final StackTrace? stackTrace;
  final String? label;

  UnknownError({
    this.errorMessage = 'Unknown error',
    this.label = 'Unknown error',
    this.exception,
    this.stackTrace,
  }) : super(
          message: exception,
          stackTrace: stackTrace,
          label: label,
          exception: exception,
        );
}
