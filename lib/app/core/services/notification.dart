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
  Stream<ReceivedNotification> get onPushStream;
}

class NotificationService extends GetxService implements INotificationService {
  final AppColors appColors;

  late final AwesomeNotifications _plugin;
  late final StreamController<ReceivedAction> _tapController;
  late final StreamController<ReceivedNotification> _pushController;

  NotificationService(this.appColors) {
    _plugin = AwesomeNotifications();
    _tapController = StreamController<ReceivedAction>.broadcast();
    _pushController = StreamController<ReceivedNotification>.broadcast();
  }

  static const _channelKey = 'basic_channel';

  @override
  Stream<ReceivedAction> get onTapStream => _plugin.actionStream;

  @override
  Stream<ReceivedNotification> get onPushStream => _pushController.stream;

  @override
  void onInit() {
    init();
    _registerListeners();

    super.onInit();
  }

  @override
  void onClose() {
    _tapController.close();
    _pushController.close();
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

  _registerListeners() {
    _pushListener();
  }

  void _pushListener() {
    _plugin.createdStream.listen((event) => _pushController.add(event));
  }
}
