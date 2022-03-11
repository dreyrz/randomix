import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:randomix/app/core/errors/failure.dart';

import 'package:randomix/app/core/services/api.dart';
import 'package:randomix/app/modules/splash/external/spotify/datasources/datasource.dart';
import 'package:randomix/app/modules/splash/infra/datasources/splash_datasource_interface.dart';

import '../../../../../mocks/errors.dart';
import '../../../../../mocks/jsons.dart';
import '../../../../../mocks/services.dart';
import '../../../../../mocks/utils.dart';

class ResponseMock extends Mock implements Response {}

main() {
  late final ISplashDatasource datasource;
  late final IApi api;
  setUpAll(() {
    api = ApiMock();
    datasource = SplashDatasource(api);
  });

  group('getToken', () {
    test('Should return a String when request is ok', () async {
      when(() => api.post('', data: {"grant_type": "client_credentials"}))
          .thenAnswer((_) async => Response(
                data: jsonDecode(getTokenJson),
                requestOptions: RequestOptions(path: anyString),
              ));

      final result = await datasource.getToken();
      expect(result, isA<String>());
    });

    test('Should throw a Failure when request fails', () async {
      when(() => api.post('', data: {"grant_type": "client_credentials"}))
          .thenAnswer((_) async => throw FailureMock());
      await expectLater(datasource.getToken(), throwsA(isA<Failure>()));
    });
  });

  group('getGenres', () {
    test('Expect to return a Api', () async {
      when(() => api.get('/available-genre-seeds'))
          .thenAnswer((_) async => Response(
                data: jsonDecode(getGenresJson),
                requestOptions: RequestOptions(path: anyString),
              ));
      final result = await datasource.getGenres();
      expect(result, isA<List<String>>());
    });
  });
}
