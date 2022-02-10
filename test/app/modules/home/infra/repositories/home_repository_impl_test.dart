import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:randomix/app/core/error/failure.dart';

import 'package:randomix/app/modules/home/infra/datasources/home_datasource_interface.dart';
import 'package:randomix/app/modules/home/infra/repositories/home_repository.dart';

import '../../../../mocks/entities_mock.dart';
import '../../../../mocks/errors_mock.dart';
import '../../../../mocks/utils_mock.dart';

class HomeDatasourceMock extends Mock implements IHomeDatasource {}

main() {
  late IHomeDatasource datasource;
  late HomeRepository repositoryImpl;

  setUp(() {
    datasource = HomeDatasourceMock();
    repositoryImpl = HomeRepository(datasource);
  });

  test('Expect to return a track when external returns a Track', () async {
    when(() => datasource.getRandomTrackByGenre(anyString))
        .thenAnswer((_) async => TrackMock());

    final result = await repositoryImpl.getRandomTrackByGenre(anyString);
    expect(result.fold(id, id), isA<TrackMock>());
  });

  test('Expect to return a track when external throws a TrackError', () async {
    when(() => datasource.getRandomTrackByGenre(anyString))
        .thenThrow(FailureMock());

    final result = await repositoryImpl.getRandomTrackByGenre(anyString);
    expect(result.fold(id, id), isA<Failure>());
  });
}
