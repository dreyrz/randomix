import 'package:flutter/material.dart';

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
        color: color ?? const Color(0xffDD669F),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            title,
            style: style ??
                const TextStyle(
                  fontSize: 20,
                  color: Color(0xffFFF5F5),
                ),
          ),
        ),
      ),
    );
  }
}
