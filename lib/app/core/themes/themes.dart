import 'package:flutter/material.dart';
import 'package:randomix/app/core/themes/colors.dart';
import 'package:randomix/app/core/themes/text_styles.dart';

abstract class AppTheme {
  ThemeData get light;
  // ThemeData get dark;
}

class RandomixTheme implements AppTheme {
  const RandomixTheme({
    required this.colors,
    required this.textStyle,
  });

  final AppColors colors;
  final AppTextStyles textStyle;

  @override
  ThemeData get light {
    return ThemeData.light().copyWith(
      backgroundColor: colors.white,
      appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle: textStyle.theme.headline2,
          iconTheme: IconThemeData(
            color: colors.black,
          )),
      primaryColor: colors.primary,
      secondaryHeaderColor: colors.black,
      bottomAppBarColor: colors.white,
      textTheme: textStyle.theme,
    );
  }

  // @override
  // ThemeData get dark {
  //   return ThemeData.dark().copyWith(
  //     backgroundColor: colors.black,
  //     appBarTheme: AppBarTheme(
  //         color: Colors.transparent,
  //         elevation: 0,
  //         titleTextStyle: textStyle.theme.headline2,
  //         iconTheme: IconThemeData(
  //           color: colors.white,
  //         )),
  //     primaryColor: colors.primary,
  //     secondaryHeaderColor: colors.white,
  //     bottomAppBarColor: colors.white,
  //     textTheme: textStyle.theme,
  //   );
  // }
}
