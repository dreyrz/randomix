import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';

import '../themes/_themes.dart';

typedef OnTapCallback = void Function(Map<String, String> payload);

abstract class INotificationService {
  Future<void> init();
  Future<void> push({
    String? title,
    String? body,
    String? imageUrl,
    Map<String, String>? payload,
  });
  set onTap(OnTapCallback onTapCallback);
}

class NotificationService implements INotificationService {
  final AppColors appColors;
  late final AwesomeNotifications _plugin;

  NotificationService(this.appColors) {
    _plugin = AwesomeNotifications();
  }

  static const _channelKey = 'basic_channel';

  OnTapCallback _onTapCallback = (_) {};

  @override
  Future<void> init() async {
    await _plugin.initialize(
      'resource://mipmap/ic_notif',
      [
        NotificationChannel(
          channelKey: _channelKey,
          channelName: 'Randomfy notifications',
          channelDescription: 'Notification channel for random tracks',
          defaultColor: appColors.primary,
        )
      ],
      debug: kDebugMode,
    );
    _onTapListener();
  }

  @override
  Future<void> push({
    String? title,
    String? body,
    String? imageUrl,
    Map<String, String>? payload,
  }) async {
    await _plugin.createNotification(
      content: NotificationContent(
        id: 0,
        channelKey: _channelKey,
        title: title,
        body: body,
        bigPicture: imageUrl,
        notificationLayout:
            imageUrl != null ? NotificationLayout.BigPicture : null,
        payload: payload,
      ),
    );
  }

  @override
  set onTap(OnTapCallback callback) => _onTapCallback = callback;

  void _onTapListener() {
    _plugin.actionStream.listen((data) {
      if (data.payload != null) {
        _onTapCallback(data.payload!);
      }
    });
  }
}
