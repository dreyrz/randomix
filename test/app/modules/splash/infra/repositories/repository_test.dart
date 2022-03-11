import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:randomix/app/core/errors/failure.dart';
import 'package:randomix/app/modules/splash/infra/datasources/splash_datasource_interface.dart';
import 'package:randomix/app/modules/splash/infra/repositories/repository.dart';

import '../../../../mocks/datasources.dart';
import '../../../../mocks/errors.dart';
import '../../../../mocks/utils.dart';

main() {
  late final ISplashDatasource datasource;
  late final SplashRepository repositoryImpl;

  setUpAll(() {
    datasource = SplashDatasourceMock();
    repositoryImpl = SplashRepository(datasource);
  });

  group('getToken', () {
    test('Expect to return a String when external returns a String', () async {
      when(() => datasource.getToken()).thenAnswer((_) async => anyString);

      final result = await repositoryImpl.getToken();
      expect(result.fold(id, id), isA<String>());
    });

    test('Expect to get a Failure when external throws a Failure', () async {
      when(() => datasource.getToken()).thenThrow(FailureMock());

      final result = await repositoryImpl.getToken();
      expect(result.fold(id, id), isA<Failure>());
    });
  });
  group('getGenres', () {
    test('Expect to return a Genres when external returns a Genre', () async {
      when(() => datasource.getGenres()).thenAnswer((_) async => <String>[]);

      final result = await repositoryImpl.getGenres();
      expect(result.fold(id, id), isA<List<String>>());
    });
    test('Expect to get a Failure when external throws a Failure', () async {
      when(() => datasource.getGenres()).thenThrow(FailureMock());

      final result = await repositoryImpl.getGenres();
      expect(result.fold(id, id), isA<Failure>());
    });
  });
}
