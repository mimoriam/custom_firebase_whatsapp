import 'package:flutter/material.dart';

/// Models:

/// Screens:

/// Widgets:

/// Services:

/// State:

/// Utils/Helpers:
import 'package:shared_preferences/shared_preferences.dart';

/// Entry Point:
class ThemeStateProvider extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences? _prefs;
  late bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeStateProvider() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs!.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs!.setBool(key, _darkTheme);
  }
}

/*
SwitchListTile(
            onChanged: (val) {
              Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
            },
            value: Provider.of<ThemeNotifier>(context).darkTheme,
          ),
 */
