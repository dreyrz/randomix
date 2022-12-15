import 'package:workmanager/workmanager.dart';

abstract class IBackgroundTaskService {
  Future<void> init(Function dispatcher);
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
  Future<void> init(Function dispatcher) async {
    await _plugin.initialize(dispatcher);
  }

  @override
  Future<void> schedule() async {
    await _plugin.registerPeriodicTask(taskKey, taskKey,
        frequency: const Duration(hours: 12));
  }

  @override
  Future<void> cancelAll() async {
    await _plugin.cancelAll();
  }

  @override
  Future<bool> dispatcher(Future<void> Function() callback) async {
    _plugin.executeTask((taskName, inputData) async {
      if (taskName == BackgroundTaskService.taskKey) {
        await callback();
      }
      return Future.value(true);
    });
    return Future.value(true);
  }
}
