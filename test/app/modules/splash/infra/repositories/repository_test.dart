import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:randomix/app/core/error/failure.dart';
import 'package:randomix/app/modules/splash/infra/datasources/splash_datasource_interface.dart';
import 'package:randomix/app/modules/splash/infra/repositories/repository.dart';

import '../../../../mocks/datasources.dart';
import '../../../../mocks/errors_mock.dart';
import '../../../../mocks/utils_mock.dart';

main() {
  late final ISplashDatasource datasource;
  late final SplashRepository repositoryImpl;

  setUpAll(() {
    datasource = SplashDatasourceMock();
    repositoryImpl = SplashRepository(datasource);
  });

  test('Expect to return a String when external returns a String', () async {
    when(() => datasource.getToken(anyString))
        .thenAnswer((_) async => anyString);

    final result = await repositoryImpl.getToken(anyString);
    expect(result.fold(id, id), isA<String>());
  });

  test('Expect to get a Failure when external throws a Failure', () async {
    when(() => datasource.getToken(anyString)).thenThrow(FailureMock());

    final result = await repositoryImpl.getToken(anyString);
    expect(result.fold(id, id), isA<Failure>());
  });
}
