import 'package:flutter/material.dart';

import '../../../../core/utils/mixins/_mixins.dart';
import '../../../../core/widgets/loading.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final bool isNotificationsEnabled;
  final VoidCallback onNotificationIconPressed;
  const CustomAppBar({
    Key? key,
    required this.isNotificationsEnabled,
    required this.onNotificationIconPressed,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> with FuctionUtils {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      leading: IconButton(
        color: Theme.of(context).secondaryHeaderColor,
        icon: _isLoading
            ? Loading(
                color: Theme.of(context).primaryColor,
              )
            : Icon(
                widget.isNotificationsEnabled
                    ? Icons.notifications
                    : Icons.notification_add_outlined,
                size: 32,
              ),
        onPressed: () {
          if (_isLoading) {
            return;
          }

          handleFutureOrFunction(widget.onNotificationIconPressed, (a) {
            setState(() => _isLoading = a);
          });
        },
      ),
      // actions: [
      //   IconButton(
      //     color: Theme.of(context).secondaryHeaderColor,
      //     icon: const Icon(
      //       Icons.settings,
      //       size: 32,
      //     ),
      //     onPressed: () {},
      //   )
      // ],
    );
  }
}
