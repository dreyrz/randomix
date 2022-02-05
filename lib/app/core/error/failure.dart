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
