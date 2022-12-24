import 'package:flutter/material.dart';

class CustomImage extends Image {
  CustomImage(String src, {Key? key, double? height, double? width})
      : super.network(
          src,
          errorBuilder: (a, b, c) => const Icon(Icons.error),
          height: height,
          width: width,
          key: key,
        );
}
