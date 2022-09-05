import 'package:flutter/material.dart';

class TrackDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback onIconTap;

  const TrackDetailsAppBar({
    Key? key,
    required this.onIconTap,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      actions: [
        IconButton(
          color: Theme.of(context).secondaryHeaderColor,
          icon: const Icon(
            Icons.more_vert,
            size: 32,
          ),
          onPressed: onIconTap,
        )
      ],
    );
  }
}
