import 'package:randomix/app/modules/splash/domain/repositories/repository_interface.dart';
import 'package:randomix/app/modules/splash/domain/usecases/get_genres.dart';
import 'package:randomix/app/modules/splash/external/spotify/datasources/datasource.dart';
import 'package:randomix/app/modules/splash/infra/datasources/splash_datasource_interface.dart';
import 'package:randomix/app/modules/splash/infra/repositories/repository.dart';

import '../../../../core/services/_services.dart';
import 'get_token.dart';

abstract class ISplashUseCaseFactory {
  GetToken getTokenUseCase();
  GetGenres getGenresUseCase();
}

class SplashUseCaseFactory implements ISplashUseCaseFactory {
  final IApi _api;
  late final ISplashDatasource _datasource;
  late final ISplashRepository _repository;
  SplashUseCaseFactory(this._api) {
    _datasource = SplashDatasource(_api);
    _repository = (SplashRepository(_datasource));
  }
  @override
  GetGenres getGenresUseCase() {
    return GetGenres(_repository);
  }

  @override
  GetToken getTokenUseCase() {
    return GetToken(_repository, _api);
  }
}
