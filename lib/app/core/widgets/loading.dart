import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final double? size;

  const Loading({this.size = 30, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        color: Theme.of(context).backgroundColor,
      ),
    );
  }
}
