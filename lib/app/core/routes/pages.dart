import 'package:get/get.dart';

import '../../modules/home/presenter/home_binding.dart';
import '../../modules/home/presenter/home_page.dart';
import '../../modules/splash/presenter/splash_binding.dart';
import '../../modules/splash/presenter/splash_page.dart';
import 'routes.dart';

class Pages {
  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
