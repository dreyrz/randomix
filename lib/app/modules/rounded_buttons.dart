import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const RoundedButton(
      {required this.color, required this.title, required this.style});

  final Color color;
  final String title;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Material(
        elevation: 1,
        color: color,
        borderRadius: BorderRadius.circular(20.0),
        child: MaterialButton(
          onPressed: null,
          child: Center(
            child: Text(
              title,
              style: style,
            ),
          ),
        ),
      ),
    );
  }
}
