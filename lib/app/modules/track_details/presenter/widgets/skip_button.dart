import 'package:flutter/material.dart';
import 'package:randomix/app/core/utils/mixins/function_utils.dart';

class SkipButton extends StatefulWidget {
  final FutureOrCallback onPressed;
  final bool isForward;

  const SkipButton({
    required this.onPressed,
    this.isForward = true,
    Key? key,
  }) : super(key: key);

  @override
  State<SkipButton> createState() => _SkipButtonState();
}

class _SkipButtonState extends State<SkipButton> with FunctionUtils {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 48,
      color: Theme.of(context).secondaryHeaderColor,
      onPressed: () {
        if (!_isLoading) {
          handleFutureOrFunction(widget.onPressed, (a) {
            setState(() => _isLoading = a);
          });
        }
      },
      icon: Icon(widget.isForward ? Icons.skip_next : Icons.skip_previous),
    );
  }
}
