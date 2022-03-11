import 'package:dio/dio.dart';

import '../../../../../core/services/api.dart';
import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/track.dart';
import '../../../domain/errors/errors.dart';
import '../../../infra/datasources/home_datasource_interface.dart';
import '../../../infra/models/track_model.dart';

class HomeDataSource implements IHomeDatasource {
  final IApi _api;
  HomeDataSource(this._api);
  @override
  Future<Track> getRandomTrackByGenre(
    String genre, {
    int limit = 1,
    String market = 'US',
  }) async {
    try {
      final query = "?limit=$limit&market=$market&seed_genres=$genre";
      final response = await _api.get(query);
      return TrackModel(response.data);
    } on DioError catch (e, stackTrace) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw TrackNoInternetConnection('getRandomTrackByGenre');
      } else {
        throw TrackError(
          e,
          stackTrace,
          'getRandomTrackByGenre',
          e.response.toString(),
        );
      }
    } catch (e, stackTrace) {
      throw UnknownError(
        e,
        stackTrace,
      );
    }
  }
}
