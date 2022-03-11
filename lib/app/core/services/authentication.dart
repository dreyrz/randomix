import 'package:get/get.dart';

abstract class IAuthenticationService {
  void setToken(String token);
  String? get token;
}

class AuthenticationService extends GetxService
    implements IAuthenticationService {
  String? _token;

  @override
  void setToken(String token) => _token = token;

  @override
  String? get token => _token;
}
