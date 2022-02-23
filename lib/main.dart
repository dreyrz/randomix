import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:randomix/app/core/bindings/bindings.dart';
import 'package:randomix/app/core/themes/text_styles.dart';
import 'app/core/themes/colors.dart';
import 'app/core/themes/themes.dart';

import 'app/core/routes/pages.dart';

void main() {
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
      theme: theme.light,
      darkTheme: theme.dark,
    );
  }
}
