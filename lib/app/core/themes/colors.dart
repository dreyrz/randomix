import 'package:flutter/cupertino.dart';

abstract class AppColors {
  Color get primary;
  Color get white;
  Color get black;
}

class RandomixColors implements AppColors {
  @override
  Color get primary => const Color(0xffDD669F);

  @override
  Color get white => const Color(0xffFFF5F5);

  @override
  Color get black => const Color(0xff282125);
}
