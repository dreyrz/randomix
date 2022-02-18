import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const RoundedButton({
    required this.title,
    required this.onPressed,
    this.height,
    this.color,
    this.style,
  });

  final Color? color;
  final String title;
  final double? height;
  final TextStyle? style;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      padding: const EdgeInsets.symmetric(horizontal: 35),
      decoration: BoxDecoration(
        color: color ?? Get.theme.primaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            title,
            style: style ??
                TextStyle(
                  fontSize: 20,
                  color: Get.theme.bottomAppBarColor,
                ),
          ),
        ),
      ),
    );
  }
}
