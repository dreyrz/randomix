import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primary;
  Color get white;
  Color get black;
}

class RandomixColors implements AppColors {
  @override
  Color get primary => const Color(0xffDD669F);

  @override
  Color get white => const Color.fromARGB(255, 255, 255, 255);

  @override
  Color get black => const Color(0xff282125);
}
