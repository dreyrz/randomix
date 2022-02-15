import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:randomix/app/core/errors/failure.dart';

import 'package:randomix/app/core/services/api.dart';
import 'package:randomix/app/modules/splash/external/spotify/datasources/datasource.dart';
import 'package:randomix/app/modules/splash/infra/datasources/splash_datasource_interface.dart';

import '../../../../../mocks/errors_mock.dart';
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

  test('Should return a String when request is ok', () async {
    when(() => api.post('', data: {"grant_type": "client_credentials"}))
        .thenAnswer((_) async => Response(
              data: jsonDecode(jsonResponse),
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
}

const jsonResponse = r'''
{"access_token":"BQAWLmqUZmqw5BCDI_fY0rmPHIeyfffjFhxJuwE2k1byNDwc5CJjFV7JgcIXJMVP-hQg0KaeRWT4ql_JCn4","token_type":"Bearer","expires_in":3600}
''';
