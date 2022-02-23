import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppTextStyles {
  TextTheme get theme;
}

class RandomixTextStyles implements AppTextStyles {
  RandomixTextStyles(this.colors);
  final AppColors colors;

  @override
  TextTheme get theme => TextTheme(
        headline1: TextStyle(
          fontSize: 32,
          color: colors.black,
        ),
        headline2: TextStyle(
          fontSize: 24,
          color: colors.black,
        ),
        headline3: TextStyle(
          fontSize: 16,
          color: colors.black,
        ),
      );
}
