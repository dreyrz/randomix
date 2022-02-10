import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:randomix/app/modules/home/domain/usecases/get_random_track_by_genre.dart';

import '../../../../../mocks/entities_mock.dart';
import '../../../../../mocks/errors_mock.dart';
import '../../../../../mocks/repositories_mock.dart';
import '../../../../../mocks/utils_mock.dart';

main() {
  late final HomeRepositoryMock repository;
  late final GetRandomTrackByGenre usecase;

  setUpAll(() {
    repository = HomeRepositoryMock();
    usecase = GetRandomTrackByGenre(repository);
  });
  test('Expect to return a Track when infra returns a Right', () async {
    when(() => repository.getRandomTrackByGenre(anyString))
        .thenAnswer((_) async => Right(TrackMock()));
    final result = await usecase(anyString);
    expect(result.fold(id, id), isA<TrackMock>());
  });
  test('Expect to return a TrackError when infra returns a Left', () async {
    when(() => repository.getRandomTrackByGenre(anyString))
        .thenAnswer((_) async => Left(TrackErrorMock()));
    final result = await usecase(anyString);
    expect(result.fold(id, id), isA<TrackErrorMock>());
  });
}
