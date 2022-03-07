import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final double height;
  final double width;

  const Loading({this.height = 30, this.width = 30, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CircularProgressIndicator(
        color: Theme.of(context).backgroundColor,
      ),
    );
  }
}
