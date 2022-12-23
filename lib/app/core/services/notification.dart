import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../themes/_themes.dart';

typedef OnTapCallback = void Function(Map<String, String>? payload);

abstract class INotificationService {
  Future<void> init();
  Future<void> push({
    String? title,
    String? body,
    String? imageUrl,
    Map<String, String>? payload,
  });
  Stream<ReceivedAction> get onTapStream;
}

class NotificationService extends GetxService implements INotificationService {
  final AppColors appColors;
  late final AwesomeNotifications _plugin;

  NotificationService(this.appColors) {
    _plugin = AwesomeNotifications();
  }

  static const _channelKey = 'basic_channel';

  final _controller = StreamController<ReceivedAction>.broadcast();

  @override
  Stream<ReceivedAction> get onTapStream => _controller.stream;

  @override
  void onInit() {
    init();
    _tapListener();
    super.onInit();
  }

  @override
  void onClose() {
    _controller.close();
    super.onClose();
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
          defaultColor: appColors.primary,
        )
      ],
      debug: kDebugMode,
    );
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

  void _tapListener() {
    _plugin.actionStream.listen((event) => _controller.add(event));
  }
}
