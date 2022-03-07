import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../core/widgets/loading.dart';

class CircularButton extends StatefulWidget {
  const CircularButton({required this.onPressed, this.size, Key? key})
      : super(key: key);

  final FutureOr<void> Function()? onPressed;
  final double? size;

  @override
  State<CircularButton> createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton> {
  bool _isLoading = false;
  void _onPressed() async {
    if (widget.onPressed == null) {
      return;
    }
    if (widget.onPressed is Future<void> Function()) {
      try {
        setState(() => _isLoading = true);
        await widget.onPressed!();
      } catch (e) {
        log(e.toString(), name: "CircularButton callback");
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
      return;
    }
    widget.onPressed!();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size,
      width: widget.size,
      child: ElevatedButton(
        onPressed: _onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
          primary: Theme.of(context).primaryColor,
        ),
        child: _isLoading
            ? Loading(
                size: widget.size != null ? widget.size! / 2 : widget.size,
              )
            : Icon(
                Icons.shuffle,
                color: Colors.white,
                size: widget.size != null ? widget.size! / 2 : widget.size,
              ),
      ),
    );
  }
}
