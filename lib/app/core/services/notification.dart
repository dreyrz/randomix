import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class INotificationService {
  Future<void> init();
  Future<void> push({
    String? title,
    String? body,
    String? payload,
  });
}

class NotificationService implements INotificationService {
  late final FlutterLocalNotificationsPlugin _plugin;
  NotificationService() {
    _plugin = FlutterLocalNotificationsPlugin();
  }
  @override
  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_notif');

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await _plugin.initialize(initializationSettings);
  }

  @override
  Future<void> push({String? title, String? body, String? payload}) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'randomixChannelId',
      'randomix',
      channelDescription: 'Randomix track notifications',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await _plugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }
}
