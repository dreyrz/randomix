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
          fontSize: 28,
          color: colors.black,
          fontWeight: FontWeight.w600,
        ),
        headline2: TextStyle(
          fontSize: 24,
          color: colors.black,
          fontWeight: FontWeight.w600,
        ),
        headline3: TextStyle(
          fontSize: 16,
          color: colors.black,
          fontWeight: FontWeight.w600,
        ),
      );
}
