import 'package:flutter/material.dart';
import 'package:randomix/app/core/themes/colors.dart';

class AppTheme {
  const AppTheme({required this.colors});
  final AppColors colors;

  ThemeData get light {
    return ThemeData.light().copyWith(
      backgroundColor: colors.white,
      primaryColor: colors.primary,
      secondaryHeaderColor: colors.black,
      bottomAppBarColor: colors.white,
    );
  }

  ThemeData get dark {
    return ThemeData.dark().copyWith(
      backgroundColor: colors.black,
      primaryColor: colors.primary,
      secondaryHeaderColor: colors.white,
      bottomAppBarColor: colors.white,
    );
  }
}
