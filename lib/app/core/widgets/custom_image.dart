import 'package:flutter/material.dart';

import 'loading.dart';

class CustomImage extends Image {
  CustomImage(String src, {Key? key, double? height, double? width})
      : super.network(
          src,
          errorBuilder: (a, b, c) => const Icon(Icons.error),
          loadingBuilder: (context, image, loading) {
            if (loading != null) {
              return SizedBox(
                height: height ?? 80,
                width: width ?? 80,
                child: Center(
                  child: Loading(
                    color: Theme.of(context).primaryColor,
                    size: 30,
                    strokeWidth: 2,
                  ),
                ),
              );
            } else {
              return image;
            }
          },
          height: height,
          width: width,
          key: key,
        );
}
