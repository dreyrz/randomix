import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:randomix/app/modules/home/domain/entities/track.dart';
import 'package:randomix/app/modules/home/domain/errors/errors.dart';

import 'package:randomix/app/modules/home/domain/repositories/home_repository.dart';
import 'package:randomix/app/modules/home/domain/usecases/get_random_track_by_genre.dart';

import '../../../../../mocks/mocks.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

class TrackMock extends Mock implements Track {}

class TrackErrorMock extends Mock implements TrackError {}

main() {
  late HomeRepositoryMock repository;
  late GetRandomTrackByGenre usecase;

  setUp(() {
    repository = HomeRepositoryMock();
    usecase = GetRandomTrackByGenre(repository: repository);
  });
  test('Expect to return a Right when getRandomTrackByGenre returns a Right',
      () async {
    when(() => repository.getRandomTrackByGenre(anyString))
        .thenAnswer((_) async => Right(TrackMock()));
    final result = await usecase(anyString);
    expect(result, isA<Right>());
  });
  test('Expect to return a Left when getRandomTrackByGenre returns a Left',
      () async {
    when(() => repository.getRandomTrackByGenre(anyString))
        .thenAnswer((_) async => Left(TrackErrorMock()));
    final result = await usecase(anyString);
    expect(result, isA<Left>());
  });
}
