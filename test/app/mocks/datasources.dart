import 'package:mocktail/mocktail.dart';
import 'package:randomix/app/modules/home/infra/datasources/home_datasource_interface.dart';
import 'package:randomix/app/modules/splash/infra/datasources/splash_datasource_interface.dart';

class HomeDatasourceMock extends Mock implements IHomeDatasource {}

class SplashDatasourceMock extends Mock implements ISplashDatasource {}
