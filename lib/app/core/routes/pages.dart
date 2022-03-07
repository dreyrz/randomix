import 'package:get/get.dart';

import '../../modules/about/presenter/bindings.dart';
import '../../modules/about/presenter/page.dart';
import '../../modules/base/presenter/bindings.dart';
import '../../modules/base/presenter/page.dart';
import '../../modules/home/presenter/binding.dart';
import '../../modules/home/presenter/page.dart';
import '../../modules/library/presenter/bindings.dart';
import '../../modules/library/presenter/page.dart';
import '../../modules/splash/presenter/binding.dart';
import '../../modules/splash/presenter/page.dart';
import 'routes.dart';

class Pages {
  static final routes = [
    GetPage(
      name: Routes.base,
      page: () => const BasePage(),
      binding: BaseBinding(),
    ),
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
    GetPage(
      name: Routes.about,
      page: () => const AboutPage(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: Routes.library,
      page: () => const LibraryPage(),
      binding: LibraryBinding(),
    )
  ];
}
