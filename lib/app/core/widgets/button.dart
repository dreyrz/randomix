import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loading.dart';

class Button extends StatefulWidget {
  const Button({
    required this.title,
    required this.onPressed,
    this.height,
    this.color,
    this.style,
    Key? key,
  }) : super(key: key);

  final Color? color;
  final String title;
  final double? height;
  final TextStyle? style;
  final FutureOr<void> Function()? onPressed;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
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
        log(e.toString(), name: "Button callback");
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
      height: widget.height ?? 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: widget.color ?? Get.theme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: _onPressed,
        child: Center(
          child: _isLoading
              ? const Loading()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Text(
                    widget.title,
                    style: widget.style ??
                        TextStyle(
                          fontSize: 20,
                          color: Get.theme.bottomAppBarColor,
                        ),
                  ),
                ),
        ),
      ),
    );
  }
}
