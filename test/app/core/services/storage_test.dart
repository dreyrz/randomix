import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:randomix/app/core/services/storage.dart';

import '../../mocks/utils.dart';

main() {
  late final IStorageService service;
  injectDependencies() {
    Get.put<IStorageService>(StorageService());
  }

  setUpAll(() {
    injectDependencies();
    service = Get.find<IStorageService>();
  });

  group('Storage String methods', () {
    test('Expect to be maintain the value when it has been saved', () async {
      await service.setString('key', anyString);
      final value = service.readString('key');
      expect(value, anyString);
    });

    test('Expect to change the value', () async {
      await service.setString('key', anyString);
      await service.setString('key', 'random String');
      final value = service.readString('key');
      expect(value, 'random String');
    });

    test('Expect to have a String value removed', () async {
      service.setString('key', anyString);
      await service.remove('key');
      final value = service.readString('key');
      expect(value, null);
    });
  });

  group('Storage bool methods', () {
    test('Expect to be maintain the value when it has been saved', () async {
      await service.setBool('key', true);
      final value = service.readBool('key');
      expect(value, true);
    });

    test('Expect to change the value', () async {
      await service.setBool('key', true);
      await service.setBool('key', false);
      final value = service.readBool('key');
      expect(value, false);
    });

    test('Expect to have a Bool value removed', () async {
      service.setBool('key', true);
      await service.remove('key');
      final value = service.readBool('key');
      expect(value, null);
    });
  });

  //TODO: Test remove, test null error cases
}
