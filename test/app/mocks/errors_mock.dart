import 'package:mocktail/mocktail.dart';
import 'package:randomix/app/core/error/failure.dart';
import 'package:randomix/app/modules/home/domain/errors/errors.dart';
import 'package:randomix/app/modules/splash/domain/errors/errors.dart';

class FailureMock extends Mock implements Failure {}

class TrackErrorMock extends Mock implements TrackError {}

class SplashErrorMock extends Mock implements SplashError {}
