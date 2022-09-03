import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:workmanager/workmanager.dart';

import 'app/core/bindings/bindings.dart';
import 'app/core/config/config.dart';
import 'app/core/entities/_entities.dart';
import 'app/core/routes/pages.dart';
import 'app/core/routes/routes.dart';
import 'app/core/services/_services.dart';
import 'app/core/themes/colors.dart';
import 'app/core/themes/text_styles.dart';
import 'app/core/themes/themes.dart';
import 'app/core/utils/usecase.dart';
import 'app/modules/home/domain/repositories/repository_interface.dart';
import 'app/modules/home/domain/usecases/get_random_track_by_genre.dart';
import 'app/modules/home/external/datasources/datasource.dart';
import 'app/modules/home/infra/datasources/home_datasource_interface.dart';
import 'app/modules/home/infra/repositories/repository.dart';
import 'app/modules/splash/domain/repositories/repository_interface.dart';
import 'app/modules/splash/domain/usecases/get_genres.dart';
import 'app/modules/splash/domain/usecases/get_token.dart';
import 'app/modules/splash/external/spotify/datasources/datasource.dart';
import 'app/modules/splash/infra/datasources/splash_datasource_interface.dart';
import 'app/modules/splash/infra/repositories/repository.dart';

IUseCase<String, Track> _getTrackUseCase(IApi api) {
  final IHomeDatasource _homDatasource = HomeDataSource(api);
  final IHomeRepository _homeRepository = HomeRepository(_homDatasource);
  return GetRandomTrackByGenre(_homeRepository);
}

Future<String> _getBearerToken(ISplashRepository repository, IApi api) async {
  final res = await GetToken(repository, api)();
  return res.fold(
    (l) => '',
    (token) => token,
  );
}

Future<List<String>> _getGenres(IApi api) async {
  final ISplashDatasource splashDatasource = SplashDatasource(api);
  final ISplashRepository splashRepository = SplashRepository(splashDatasource);
  final token = await _getBearerToken(splashRepository, api);
  api.token = token;
  api.baseUrl = Config.baseUrl;

  final res = await GetGenres(splashRepository)();
  return res.fold((l) => [], (r) => r);
}

Future<void> _getRandomTrackNotification(IApi api) async {
  try {
    final INotificationService notificationService = NotificationService();
    await notificationService.init();
    final genres = await _getGenres(api);

    final getRandomTrackUseCase = _getTrackUseCase(api);
    final index = math.Random().nextInt(genres.length);
    final res = await getRandomTrackUseCase.call(genres[index]);
    res.fold(
      (l) => log(l.toString()),
      (track) async {
        log("track $track");
        await notificationService.push(
          title: track.name,
          body: track.artistsName,
        );
      },
    );
  } catch (e) {
    log("error $e");
  }
}

Future<void> taskDispatcher() async {
  final IApi api = ApiService(baseUrl: Config.baseUrl);

  Workmanager().executeTask((taskName, inputData) async {
    if (taskName == BackgroundTaskService.taskKey) {
      log("randomTrack task");
      await _getRandomTrackNotification(api);
    }
    return Future.value(true);
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BackgroundTaskService().init(taskDispatcher);
  runApp(const Randomix());
}

class Randomix extends StatelessWidget {
  const Randomix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppColors colors = RandomixColors();
    final AppTheme theme = RandomixTheme(
      colors: colors,
      textStyle: RandomixTextStyles(colors),
    );
    return GetMaterialApp(
      title: 'Randomix',
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      getPages: Pages.routes,
      initialRoute: Routes.splash,
      theme: theme.light,
      darkTheme: theme.dark,
    );
  }
}
