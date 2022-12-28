import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/bindings/_bindings.dart';
import 'app/core/routes/_routes.dart';
import 'app/core/services/_services.dart';
import 'app/core/themes/_themes.dart';
import 'app/core/utils/_utils.dart';

// top level function required for background service
@pragma('vm:entry-point')
Future<void> _taskDispatcher() async {
  _backgroundTaskService.dispatcher(dispatcherCallback);
}

final IBackgroundTaskService _backgroundTaskService = BackgroundTaskService();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
      initialBinding: InitialBinding(),
      getPages: Pages.routes,
      initialRoute: Routes.splash,
      theme: theme.light,
      // darkTheme: theme.dark,
    );
  }
}
