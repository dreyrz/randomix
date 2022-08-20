import 'dart:async';
import 'dart:developer';

typedef FutureOrCallback = FutureOr<void> Function()?;
typedef OnLoadingCallback = void Function(bool isLoading);
mixin FutureOrFunction {
  void handleFutureOrFunction(
    FutureOrCallback function,
    OnLoadingCallback onLoading,
  ) async {
    if (function == null) {
      return;
    }
    if (function is Future<void> Function()) {
      try {
        onLoading(true);
        await function();
      } catch (e) {
        log(e.toString(), name: "handleFutureOrFunction");
      } finally {
        onLoading(false);
      }
      return;
    }
    function();
  }
}
