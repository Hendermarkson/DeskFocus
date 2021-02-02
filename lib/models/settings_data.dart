import 'package:flutter/cupertino.dart';

class SettingsData extends ChangeNotifier {
  bool _darkMode = false;
  String _selectedPage;

  bool get darkMode => _darkMode;
  String get selectedPage => _selectedPage;

  toggleAppTheme() {
    this._darkMode = !this._darkMode;
    notifyListeners();
  }

  setSelectedPage(String page) {
    this._selectedPage = page;
    notifyListeners();
  }
}
