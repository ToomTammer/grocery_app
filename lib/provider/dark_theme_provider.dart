import 'package:flutter/cupertino.dart';
import 'package:shop_app2/services/dark_theme_prefs.dart';

// ChangeNotifier คอยฟังการเปลี่ยนแปลงหรือเราต้องบอกให้เขาฟังการเปลี่ยนแปลง
class DarkThemeProvider with ChangeNotifier {
  DarkThemePrefs drakThemePrefs = DarkThemePrefs();
  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    drakThemePrefs.setDarkTheme(value);
    notifyListeners(); //แจ้งว่ามีการเปลี่ยนแปลงซึ่งอยู่ในของเรา
  }
}
