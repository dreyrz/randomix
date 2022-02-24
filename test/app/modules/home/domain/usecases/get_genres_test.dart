import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:randomix/app/core/errors/failure.dart';
import 'package:randomix/app/modules/home/domain/repositories/repository_interface.dart';
import 'package:randomix/app/modules/home/domain/usecases/get_genres.dart';
import '../../../../mocks/errors.dart';
import '../../../../mocks/repositories.dart';

void main() {
  late final IHomeRepository repository;
  late final GetGenres usecase;

  setUpAll(() {
    repository = HomeRepositoryMock();
    usecase = GetGenres(repository);
  });

  test('Expected to return a StringList when isnt an error', () async {
    when(() => repository.getGenres())
        .thenAnswer((_) async => const Right(<String>[]));
    final response = await usecase();
    expect(response.fold(id, id), isA<List<String>>());
  });

  test('Expected to return a error when is an error', () async {
    when(() => repository.getGenres())
        .thenAnswer((_) async => Left(FailureMock()));
    final response = await usecase();
    expect(response.fold(id, id), isA<Failure>());
  });
}
