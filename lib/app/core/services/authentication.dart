import 'package:get/get.dart';

abstract class IAuthentication {
  void setToken(String token);
  String? get token;
}

class AuthenticationService extends GetxService implements IAuthentication {
  String? _token;

  @override
  void setToken(String token) => _token = token;

  @override
  String? get token => _token;
}
