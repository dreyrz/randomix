import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class INotificationService {
  Future<void> init();
  Future<void> push({
    String? title,
    String? body,
    String? imageUrl,
    String? payload,
  });
}

class NotificationService implements INotificationService {
  static const _channelKey = 'basic_channel';
  late final AwesomeNotifications _plugin;
  NotificationService() {
    _plugin = AwesomeNotifications();
  }

  @override
  Future<void> init() async {
    await _plugin.initialize(
      'resource://mipmap/ic_notif',
      [
        NotificationChannel(
          channelKey: _channelKey,
          channelName: 'Randomfy notifications',
          channelDescription: 'Notification channel for random tracks',
        )
      ],
      debug: kDebugMode,
    );
  }

  @override
  Future<void> push(
      {String? title, String? body, String? imageUrl, String? payload}) async {
    await _plugin.createNotification(
      content: NotificationContent(
        id: 0,
        channelKey: _channelKey,
        title: title,
        body: body,
        bigPicture: imageUrl,
        notificationLayout: NotificationLayout.BigPicture,
      ),
    );
  }
}
