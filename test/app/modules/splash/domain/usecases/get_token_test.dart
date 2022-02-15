import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:randomix/app/modules/splash/domain/usecases/get_token.dart';

import '../../../../mocks/errors_mock.dart';
import '../../../../mocks/repositories_mock.dart';
import '../../../../mocks/utils_mock.dart';

main() {
  late final SplashRepositoryMock repository;
  late final GetToken usecase;

  setUpAll(() {
    repository = SplashRepositoryMock();
    usecase = GetToken(repository);
  });

  test('Expect to return a String when infra returns a Right', () async {
    final base64 = usecase.getBase64ClientIdAndSecret();
    when(() => repository.getToken(base64))
        .thenAnswer((_) async => const Right(anyString));
    final result = await usecase();

    expect(result.fold(id, id), isA<String>());
  });

  test('Expect to return a SplashError when infra returns a Left', () async {
    final base64 = usecase.getBase64ClientIdAndSecret();
    when(() => repository.getToken(base64))
        .thenAnswer((_) async => Left(SplashErrorMock()));
    final result = await usecase();

    expect(result.fold(id, id), isA<SplashErrorMock>());
  });
}
