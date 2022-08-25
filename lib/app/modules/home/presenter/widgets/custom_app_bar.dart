import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        color: Theme.of(context).secondaryHeaderColor,
        icon: const Icon(
          Icons.notifications_none,
          size: 32,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          color: Theme.of(context).secondaryHeaderColor,
          icon: const Icon(
            Icons.settings,
            size: 32,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
