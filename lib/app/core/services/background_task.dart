import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:workmanager/workmanager.dart';

abstract class IBackgroundTaskService {
  Future<void> init(VoidCallback dispatcher);
  Future<void> schedule();
  Future<void> cancelAll();
  Future<void> dispatcher(Future<void> Function() callback);
}

class BackgroundTaskService implements IBackgroundTaskService {
  static const taskKey = "BackgroundTaskTaskKey";
  // Workmanager get _plugin => Workmanager();
  late final Workmanager _plugin;
  BackgroundTaskService() {
    _plugin = Workmanager();
  }
  @override
  Future<void> init(VoidCallback dispatcher) async {
    await _plugin.initialize(dispatcher, isInDebugMode: kDebugMode);
  }

  @override
  Future<void> schedule() async {
    await _plugin.registerPeriodicTask(taskKey, taskKey);
  }

  @override
  Future<void> cancelAll() async {
    await _plugin.cancelAll();
  }

  Future<bool> dispatcher(Future<void> Function() callback) async {
    _plugin.executeTask((taskName, inputData) async {
      if (taskName == BackgroundTaskService.taskKey) {
        log("randomTrack task");
        await callback();
      }
      return Future.value(true);
    });
    return Future.value(true);
  }
}
