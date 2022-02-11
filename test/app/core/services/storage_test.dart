import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:randomix/app/core/services/storage.dart';

import '../../mocks/utils_mock.dart';

main() {
  late final IStorageService service;
  injectDependencies() {
    Get.put<IStorageService>(StorageService());
  }

  setUpAll(() {
    injectDependencies();
    service = Get.find<IStorageService>();
  });

  test('Expect to be a bool value when a bool value is saved', () async {
    await service.setBool('key', true);
    final value = service.readBool('key');
    expect(value, true);
  });

  test('Expect to be a String value when a String value is saved', () async {
    await service.setString('key', anyString);
    final value = service.readString('key');
    expect(value, anyString);
  });

  //TODO: Test remove, test null error cases
}
