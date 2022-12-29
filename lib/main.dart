import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/bindings/bindings.dart';
import 'app/core/routes/pages.dart';
import 'app/core/routes/routes.dart';
import 'app/core/services/_services.dart';
import 'app/core/themes/colors.dart';
import 'app/core/themes/text_styles.dart';
import 'app/core/themes/themes.dart';
import 'app/core/utils/dispatcher_callback.dart';

// top level function required
@pragma('vm:entry-point')
Future<void> _taskDispatcher() async {
  DartPluginRegistrant.ensureInitialized();
  _backgroundTaskService.dispatcher(dispatcherCallback);
}

final IBackgroundTaskService _backgroundTaskService = BackgroundTaskService();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBinding().dependencies();
  await BackgroundTaskService().init(_taskDispatcher);

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
      getPages: Pages.routes,
      initialRoute: Routes.splash,
      theme: theme.light,
      // darkTheme: theme.dark,
    );
  }
}
