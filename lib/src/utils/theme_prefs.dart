import 'package:shared_preferences/shared_preferences.dart';
import 'package:themeing/src/abstracts/abstract_theme_prefs.dart';

class ThemePreferenceimpl extends ThemePreference{
  late final SharedPreferences pref;

  ThemePreferenceimpl(this.pref);

  @override
  dynamic readData(String key) {
    dynamic obj = pref.get(key);
    return obj;
  }

  @override
  void setData(String key, value) {
    pref.setString(key, value);
  }

}