import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:randomix/app/core/services/api.dart';

import 'package:randomix/app/modules/splash/domain/usecases/get_token.dart';

import '../../../../mocks/errors.dart';
import '../../../../mocks/repositories.dart';
import '../../../../mocks/services.dart';
import '../../../../mocks/utils.dart';

intjectDependencies() {
  Get.put<IApi>(ApiMock());
}

main() {
  late final SplashRepositoryMock repository;
  late final ApiMock api;
  late final GetToken usecase;

  setUpAll(() {
    intjectDependencies();
    repository = SplashRepositoryMock();
    api = ApiMock();
    usecase = GetToken(
      repository,
      api,
    );
  });

  test('Expect to return a String when infra returns a Right', () async {
    usecase.getBase64ClientIdAndSecret();
    when(() => repository.getToken())
        .thenAnswer((_) async => const Right(anyString));
    final result = await usecase();

    expect(result.fold(id, id), isA<String>());
  });

  test('Expect to return a SplashError when infra returns a Left', () async {
    usecase.getBase64ClientIdAndSecret();
    when(() => repository.getToken())
        .thenAnswer((_) async => Left(SplashErrorMock()));
    final result = await usecase();

    expect(result.fold(id, id), isA<SplashErrorMock>());
  });
}
