import 'dart:developer' as dev;
import 'dart:math';

import '../../modules/home/domain/usecases/home_usecase_factory.dart';
import '../../modules/splash/domain/usecases/get_genres.dart';
import '../../modules/splash/domain/usecases/get_token.dart';
import '../../modules/splash/domain/usecases/splash_usecase_factory.dart';
import '../config/config.dart';
import '../constants/_constants.dart';
import '../entities/_entities.dart';
import '../services/_services.dart';
import '../themes/_themes.dart';

final INotificationService _notificationService =
    NotificationService(RandomixColors());
final IApi api = ApiService(baseUrl: Config.baseUrl);
final IStorageService _storageService = StorageService();

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

int _getRandomIndex(List list) {
  final random = Random();
  return random.nextInt(list.length);
}

Future<void> _handleTrackStorage(Track track) async {
  const tracksKey = StorageKeys.libraryTracks;
  final trackJson = track.toJson();
  final savedTracks = _storageService.readStringList(tracksKey);
  if (savedTracks != null) {
    await _storageService.setStringList(tracksKey, [...savedTracks, trackJson]);
    return;
  } else {
    await _storageService.setStringList(tracksKey, [trackJson]);
  }
}

Future<void> dispatcherCallback() async {
  await _storageService.init();
  final ISplashUseCaseFactory splashUseCaseFactory = SplashUseCaseFactory(api);
  final IHomeUseCaseFactory homeUseCaseFactory = HomeUseCaseFactory(api);

  final token = await _getToken(splashUseCaseFactory.getToken());
  api.token = token;
  api.baseUrl = Config.baseUrl;

  final genres = await _getGenres(splashUseCaseFactory.getGenres());
  final getRandomTrackByGenre = homeUseCaseFactory.getRandomTrackByGenre();

  final randomIndex = _getRandomIndex(genres);

  final res = await getRandomTrackByGenre(genres[randomIndex]);

  res.fold(
    (l) => dev.log(l.toString()),
    (track) async {
      await _notificationService.push(
        title: track.name,
        body: track.artistsName,
        imageUrl: track.album?.cover,
        payload: {"track": track.toJson()},
      );
    },
  );
  res.fold(
    (l) => dev.log(l.toString()),
    (track) async {
      await _handleTrackStorage(track);
    },
  );
}
