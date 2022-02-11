import 'package:shared_preferences/shared_preferences.dart';

abstract class SaveService {
  void storeSave(dynamic value);
  dynamic getValueInStore(dynamic key);
  void removeValues(dynamic )
}

class PackageService implements SaveService {
  @override
  getValueInStore(key) async {
    // TODO: implement getValueInStore
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('stringValue');
    //Return bool
    bool? boolValue = prefs.getBool('boolValue');
    //Return int
    int? intValue = prefs.getInt('intValue');
    //Return double
    double? doubleValue = prefs.getDouble('doubleValue');

    throw UnimplementedError();
  }

  @override
  void storeSave(value) async {
    // TODO: implement storeSave
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', "abc");
    prefs.setInt('intValue', 123);
    prefs.setDouble('doubleValue', 115.0);
    prefs.setBool('boolValue', true);
  }

  removeValues() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Remove String
  prefs.remove("stringValue");
  //Remove bool
  prefs.remove("boolValue");
  //Remove int
  prefs.remove("intValue");
  //Remove double
  prefs.remove("doubleValue");
}
}
