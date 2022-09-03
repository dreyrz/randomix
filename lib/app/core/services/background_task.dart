import 'package:flutter/foundation.dart';
import 'package:workmanager/workmanager.dart';

abstract class IBackgroundTaskService {
  Future<void> init(VoidCallback dispatcher);
  Future<void> schedule();
}

class BackgroundTaskService implements IBackgroundTaskService {
  static const taskKey = "BackgroundTaskTaskKey";
  Workmanager get _plugin => Workmanager();
  @override
  Future<void> init(VoidCallback dispatcher) async {
    await _plugin.initialize(dispatcher, isInDebugMode: kDebugMode);
  }

  @override
  Future<void> schedule() async {
    await _plugin.registerOneOffTask(taskKey, taskKey);
  }
}
