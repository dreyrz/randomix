import 'package:randomix/app/modules/home/external/datasources/datasource.dart';
import 'package:randomix/app/modules/home/infra/datasources/home_datasource_interface.dart';
import 'package:randomix/app/modules/home/infra/repositories/repository.dart';

import '../../../../core/services/_services.dart';
import '../repositories/repository_interface.dart';
import 'get_random_track_by_genre.dart';

abstract class IHomeUseCaseFactory {
  GetRandomTrackByGenre getRandomTrackByGenreUseCase();
}

class HomeUseCaseFactory implements IHomeUseCaseFactory {
  final IApi _api;
  HomeUseCaseFactory(this._api);

  @override
  GetRandomTrackByGenre getRandomTrackByGenreUseCase() {
    final IHomeDatasource datasource = HomeDataSource(_api);
    final IHomeRepository repository = HomeRepository(datasource);
    return GetRandomTrackByGenre(repository);
  }
}
