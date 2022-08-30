import 'package:flutter/material.dart';
import 'package:themeing/src/abstracts/abstract_theme_prefs.dart';

import '../utils/theme_data.dart';
import '../utils/theme_prefs.dart';

class ThemeProvider extends ChangeNotifier {
  static ThemeData? _themeData;
  ThemeData getTheme() => _themeData!;

  static late String themeMode;
  dynamic get themeModeValue => themeMode;

  String themeValue = "themeMode";
  late ThemePreference themePreferenceimpl;
  ThemeProvider(pref) {
    themePreferenceimpl = ThemePreferenceimpl(pref);
  }

  /// assert the App's theme on start up.
  assertTheme() {
    dynamic value = themePreferenceimpl.readData(themeValue);
    themeMode = value ?? 'light';
    if (themeMode == 'light') {
      _themeData = lightTheme;
    } else if(themeMode == "dark") {
      _themeData = darkTheme;
    } else {
      _themeData = deepTheme;
    }
    notifyListeners();
  }

  setTheme(String value) {
    switch (value) {
      case "light":
        setLightMode();
        break;
      case "dark":
        setDarkMode();
        break;
      case "deep":
        setDeepMode();
        break;
      default:
        setLightMode();
        break;
    }
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    themeMode = "dark";
    themePreferenceimpl.setData(themeValue, 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    themeMode = "light";
    themePreferenceimpl.setData(themeValue, 'light');
    notifyListeners();
  }

  void setDeepMode() async {
    _themeData = deepTheme;
    themeMode = "deep";
    themePreferenceimpl.setData(themeValue, 'deep');
    notifyListeners();
  }
}
