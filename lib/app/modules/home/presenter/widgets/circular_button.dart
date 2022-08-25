import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/mixins/function_utils.dart';
import '../../../../core/widgets/loading.dart';

class CircularButton extends StatefulWidget {
  final FutureOr<void> Function()? onPressed;
  final double size;
  final IconData? icon;
  final String? svgPath;
  final Color? color;
  const CircularButton({
    Key? key,
    required this.onPressed,
    this.size = 200,
    this.icon,
    this.svgPath,
    this.color,
  }) : super(key: key);

  @override
  State<CircularButton> createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton> with FuctionUtils {
  bool _isLoading = false;
  Widget handleChild() {
    if (widget.svgPath != null) {
      return SvgPicture.asset(
        widget.svgPath!,
        height: widget.size / 3,
      );
    }
    if (widget.icon != null) {
      return Icon(widget.icon!);
    }
    return const Icon(Icons.play_arrow);
  }

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
            primary: widget.color ?? Theme.of(context).primaryColor,
          ),
          child: _isLoading
              ? Loading(
                  size: widget.size / 2,
                )
              : handleChild(),
        ),
      ),
    );
  }
}
