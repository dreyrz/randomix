import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:randomix/app/core/errors/failure.dart';

import 'package:randomix/app/modules/home/infra/datasources/home_datasource_interface.dart';
import 'package:randomix/app/modules/home/infra/repositories/repository.dart';

import '../../../../mocks/datasources.dart';
import '../../../../mocks/entities.dart';
import '../../../../mocks/errors.dart';
import '../../../../mocks/utils.dart';

main() {
  late IHomeDatasource datasource;
  late HomeRepository repositoryImpl;

  setUp(() {
    datasource = HomeDatasourceMock();
    repositoryImpl = HomeRepository(datasource);
  });

  group('getRandomTrackByGenre', () {
    test('Expect to return a track when external returns a Track', () async {
      when(() => datasource.getRandomTrackByGenre(anyString))
          .thenAnswer((_) async => TrackMock());

      final result = await repositoryImpl.getRandomTrackByGenre(anyString);
      expect(result.fold(id, id), isA<TrackMock>());
    });

    test('Expect to get a Failure when external throws a Failure', () async {
      when(() => datasource.getRandomTrackByGenre(anyString))
          .thenThrow(FailureMock());

      final result = await repositoryImpl.getRandomTrackByGenre(anyString);
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
