import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final double? size;
  final Color? color;
  final double strokeWidth;
  const Loading({this.color, this.size = 30, this.strokeWidth = 7, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        color: color ?? Theme.of(context).backgroundColor,
      ),
    );
  }
}
