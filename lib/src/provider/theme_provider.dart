import 'package:flutter/material.dart';
import 'package:themeing/src/abstracts/abstract_theme_prefs.dart';

import '../utils/theme_data.dart';
import '../utils/theme_prefs.dart';

class ThemeProvider extends ChangeNotifier{

  static ThemeData? _themeData;
  ThemeData getTheme() => _themeData!;

  String themeValue = "themeMode";
  late ThemePreference themePreferenceimpl;
  ThemeProvider(pref){
    themePreferenceimpl = ThemePreferenceimpl(pref);
  }

  /// assert the App's theme on start up.
  assertTheme(){
    dynamic value = themePreferenceimpl.readData(themeValue);
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        _themeData = darkTheme;
      }
      notifyListeners();    
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    themePreferenceimpl.setData(themeValue, 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    themePreferenceimpl.setData(themeValue, 'light');
    notifyListeners();
  }
}