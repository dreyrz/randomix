import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/images_path.dart';
import '../../../core/widgets/loading.dart';

class AnimatedCircularButton extends StatefulWidget {
  const AnimatedCircularButton(
      {required this.onPressed, this.size = 200, Key? key})
      : super(key: key);

  final FutureOr<void> Function()? onPressed;
  final double? size;

  @override
  State<AnimatedCircularButton> createState() => _AnimatedCircularButtonState();
}

class _AnimatedCircularButtonState extends State<AnimatedCircularButton>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late double size;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    size = widget.size!;
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _animationController.forward();
    _animationController.addListener(_animationListener);
    _animationController.addStatusListener(_animationStatusListener);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _animationListener() {
    setState(() {
      size = widget.size! + _animationController.value * 15;
    });
  }

  void _animationStatusListener(AnimationStatus status) {
    setState(() {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
  }

  void _onPressed() async {
    if (widget.onPressed == null) {
      return;
    }
    _animationController.reset();
    _animationController.stop();
    if (widget.onPressed is Future<void> Function()) {
      try {
        setState(() => _isLoading = true);
        await widget.onPressed!();
      } catch (e) {
        log(e.toString(), name: "CircularButton callback");
      } finally {
        if (mounted) setState(() => _isLoading = false);
        _animationController.forward();
      }
      return;
    }
    widget.onPressed!();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: _isLoading,
      child: SizedBox(
        height: size,
        width: size,
        child: ElevatedButton(
            onPressed: _isLoading ? () {} : _onPressed,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20),
              primary: Theme.of(context).primaryColor,
            ),
            child: _isLoading
                ? Loading(
                    size: widget.size != null ? widget.size! / 2 : widget.size,
                  )
                : SvgPicture.asset(
                    SvgImagesPath.shuffle,
                    height: size / 3,
                  )),
      ),
    );
  }
}
