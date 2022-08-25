import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/config/config.dart';
import '../../../core/constants/storage_keys.dart';
import '../../../core/routes/routes.dart';
import '../../../core/services/_services.dart';
import '../../../core/utils/usecase.dart';

class SplashController extends GetxController {
  final IUseCaseNoParams<String> getToken;
  final IUseCaseNoParams<List<String>> getGenres;
  final IAuthenticationService _authentication;
  final IApi _api;
  final IGenresListService _genresListService;
  final IStorageService _storageService;
  SplashController(
    this.getToken,
    this.getGenres,
    this._authentication,
    this._api,
    this._genresListService,
    this._storageService,
  );

  @override
  void onInit() {
    _handleRedirect();
    _changeSystemNavigationBarColor();
    super.onInit();
  }

  Future<void> _handleRedirect() async {
    await Future.delayed(const Duration(seconds: 1));
    final isFirstAppOpen = _storageService.readBool(StorageKeys.firstAppOpen);
    final token = await _getBearerToken();
    _authentication.setToken(token);
    _api.baseUrl = Config.baseUrl;
    _api.headers = {"Authorization": "Bearer $token"};
    final genres = await _getGenresList();
    _genresListService.addGenres(genres);

    Get.offAllNamed(isFirstAppOpen == false ? Routes.base : Routes.about);
  }

  Future<String> _getBearerToken() async {
    final res = await getToken();
    return res.fold(
      (l) => '',
      (token) => token,
    );
  }

  Future<List<String>> _getGenresList() async {
    final res = await getGenres();
    return res.fold(
      (l) => [],
      (genres) => genres,
    );
  }

  void _changeSystemNavigationBarColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor:
          Get.theme.secondaryHeaderColor, // navigation bar color
    ));
  }
}
