import 'package:mocktail/mocktail.dart';
import 'package:randomix/app/modules/home/domain/repositories/repository_interface.dart';
import 'package:randomix/app/modules/splash/domain/repositories/repository_interface.dart';

class HomeRepositoryMock extends Mock implements IHomeRepository {}

class SplashRepositoryMock extends Mock implements ISplashRepository {}
