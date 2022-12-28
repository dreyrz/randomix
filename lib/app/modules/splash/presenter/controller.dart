import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:randomix/app/modules/base/presenter/bindings.dart';
import 'package:randomix/app/modules/base/presenter/page.dart';

import '../../../core/config/config.dart';
import '../../../core/entities/track.dart';
import '../../../core/routes/routes.dart';
import '../../../core/services/_services.dart';
import '../../../core/utils/usecase.dart';

class SplashController extends GetxController {
  final IUseCaseNoParams<String> getToken;
  final IUseCaseNoParams<List<String>> getGenres;
  final IAuthenticationService _authentication;
  final IApi _api;
  final IGenresListService _genresListService;
  final INotificationService _notificationService;
  SplashController(
    this.getToken,
    this.getGenres,
    this._authentication,
    this._api,
    this._genresListService,
    this._notificationService,
  );

  String? _track;
  bool _hasNavigatedToBase = false;
  @override
  void onInit() {
    _notificationService.onTapStream.listen((e) => _onTapCallback(e.payload));
    _handleRedirect();
    _changeSystemNavigationBarColor();

    super.onInit();
  }

  void _onTapCallback(Map<String, String>? payload) async {
    _track = payload!["track"];
    if (_hasNavigatedToBase) {
      Get.toNamed(Routes.trackDetails, arguments: Track.fromJson(_track!));
    }
  }

  Future<void> _handleRedirect() async {
    await Future.delayed(const Duration(seconds: 1));
    await _configApi();
    final genres = await _getGenresList();
    _genresListService.addGenres(genres);
    BaseBinding().dependencies();
    Get.to(
      () => const BasePage(),
    );
    _hasNavigatedToBase = true;
    if (_track != null) {
      Get.toNamed(Routes.trackDetails, arguments: Track.fromJson(_track!));
    }
  }

  Future<void> _configApi() async {
    final token = await _getBearerToken();
    _authentication.setToken(token);
    _api.baseUrl = Config.baseUrl;
    _api.headers = {"Authorization": "Bearer $token"};
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
