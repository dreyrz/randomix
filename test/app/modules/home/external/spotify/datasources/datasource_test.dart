import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:randomix/app/core/services/api.dart';
import 'package:randomix/app/modules/home/domain/entities/track.dart';
import 'package:randomix/app/modules/home/external/spotify/datasources/datasource.dart';
import 'package:randomix/app/modules/home/infra/datasources/home_datasource_interface.dart';

import '../../../../../mocks/jsons.dart';
import '../../../../../mocks/services.dart';
import '../../../../../mocks/utils.dart';

main() {
  late final IHomeDatasource datasource;
  late final IApi api;
  setUpAll(() {
    api = ApiMock();
    datasource = HomeDataSource(api);
  });

  group('getRandomTrackByGenre', () {
    test('Should return a String when request is ok', () async {
      const limit = 1;
      const market = 'US';

      const query = "?limit=$limit&market=$market&seed_genres=$anyString";
      when(() => api.get(query)).thenAnswer((_) async => Response(
            data: jsonDecode(getRandomTrackByGenreJson),
            requestOptions: RequestOptions(path: anyString),
          ));

      final result = await datasource.getRandomTrackByGenre(
        anyString,
        limit: limit,
        market: market,
      );
      expect(result, isA<Track>());
    });
  });
}
