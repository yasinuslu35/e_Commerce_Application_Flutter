import '../../constants/enums/locale_keys_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleManager {
  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static final LocaleManager _instance = LocaleManager._init();

  SharedPreferences? _preferences;

  static LocaleManager get instance => _instance;

  static Future preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences?.clear();
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  Future<void> setBooleanValue(PreferencesKeys key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  String getStringValue(PreferencesKeys key) =>
      _preferences?.getString(key.toString()) ?? "";

  bool getBooleanValue(PreferencesKeys key) =>
      _preferences?.getBool(key.toString()) ?? false;
}
