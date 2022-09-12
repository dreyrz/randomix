import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app/core/bindings/bindings.dart';
import 'app/core/config/config.dart';
import 'app/core/routes/pages.dart';
import 'app/core/routes/routes.dart';
import 'app/core/services/_services.dart';
import 'app/core/themes/colors.dart';
import 'app/core/themes/text_styles.dart';
import 'app/core/themes/themes.dart';
import 'app/modules/home/domain/usecases/home_usecase_factory.dart';
import 'app/modules/splash/domain/usecases/get_genres.dart';
import 'app/modules/splash/domain/usecases/get_token.dart';
import 'app/modules/splash/domain/usecases/splash_usecase_factory.dart';

Future<String> _getToken(GetToken useCase) async {
  final res = await useCase();
  return res.fold(
    (l) => '',
    (token) => token,
  );
}

Future<List<String>> _getGenres(GetGenres useCase) async {
  final res = await useCase();
  return res.fold((l) => [], (r) => r);
}

int getRandomIndex(List list) {
  final random = Random();
  return random.nextInt(list.length);
}

Future<INotificationService> bindNotificationService() async {
  final INotificationService notificationService = NotificationService();
  await notificationService.init();
  return notificationService;
}

Future<void> getRandomTrackNotification() async {
  final IApi api = ApiService(baseUrl: Config.baseUrl);
  final ISplashUseCaseFactory splashUseCaseFactory = SplashUseCaseFactory(api);
  final IHomeUseCaseFactory homeUseCaseFactory = HomeUseCaseFactory(api);
  final notificationService = await bindNotificationService();
  final token = await _getToken(splashUseCaseFactory.getToken());
  api.token = token;
  api.baseUrl = Config.baseUrl;

  final genres = await _getGenres(splashUseCaseFactory.getGenres());
  final getRandomTrackByGenre = homeUseCaseFactory.getRandomTrackByGenre();

  final randomIndex = getRandomIndex(genres);

  final res = await getRandomTrackByGenre(genres[randomIndex]);
  res.fold(
    (l) => dev.log(l.toString()),
    (track) async {
      await notificationService.push(
        title: track.name,
        body: track.artistsName,
        imageUrl: track.album?.cover,
      );
    },
  );
}

// top level function required
Future<void> taskDispatcher() async {
  backgroundTaskService.dispatcher(getRandomTrackNotification);
}

final IBackgroundTaskService backgroundTaskService = BackgroundTaskService();
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
      // darkTheme: theme.dark,
    );
  }
}
