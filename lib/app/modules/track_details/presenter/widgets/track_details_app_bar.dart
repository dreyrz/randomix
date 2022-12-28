import 'package:flutter/material.dart';
import '../../../../core/utils/_utils.dart';

class TrackDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final VoidCallback onIconTap;

  const TrackDetailsAppBar({
    this.title,
    required this.onIconTap,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title?.capitalizeFirstLetter() ?? ''),
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
