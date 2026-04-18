import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageService {
  Future<bool> isFirstTime();
  Future<void> setNotFirstTime();
}

class SharedPrefImpl implements LocalStorageService {
  final SharedPreferences prefs;

  SharedPrefImpl(this.prefs);

  static const String _firstTimeOpenAppKey = "first_time_open_app";

  /// check if the app is opened for the first time
  @override
  Future<bool> isFirstTime() async {
    return prefs.getBool(_firstTimeOpenAppKey) ?? true;
  }

  /// set the app as opened for the first time
  @override
  Future<void> setNotFirstTime() async {
    await prefs.setBool(_firstTimeOpenAppKey, false);
  }
}