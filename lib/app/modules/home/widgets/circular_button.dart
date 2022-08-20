import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/images_path.dart';
import '../../../core/utils/mixins/future_or_function.dart';
import '../../../core/widgets/loading.dart';

class CircularButton extends StatefulWidget {
  const CircularButton({required this.onPressed, this.size = 200, Key? key})
      : super(key: key);

  final FutureOr<void> Function()? onPressed;
  final double size;

  @override
  State<CircularButton> createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton> with FutureOrFunction {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: _isLoading,
      child: SizedBox(
        height: widget.size,
        width: widget.size,
        child: ElevatedButton(
            onPressed: () {
              if (_isLoading) {
                return;
              }
              handleFutureOrFunction(widget.onPressed, (a) {
                setState(() => _isLoading = a);
              });
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20),
              primary: Theme.of(context).primaryColor,
            ),
            child: _isLoading
                ? Loading(
                    size: widget.size,
                  )
                : SvgPicture.asset(
                    SvgImagesPath.shuffle,
                    height: widget.size / 3,
                  )),
      ),
    );
  }
}
