import 'dart:collection';

import 'package:desk_focus/data/repositories/app_settings_repository.dart';
import 'package:desk_focus/enums/loading_state.dart';
import 'package:desk_focus/extensions/string_extensions.dart';
import 'package:desk_focus/models/entities/app_settings.dart';
import 'package:desk_focus/services/base_data_service.dart';
import 'package:flutter/cupertino.dart';

const String sDarkModeEnabled = 'darkModeEnabled';

class SettingsDataService extends ChangeNotifier implements BaseDataService {
  final AppSettingsRepository repository;

  List<AppSetting> _appSettings = [];
  String _selectedPage;

  SettingsDataService({@required this.repository}) {
    _initData();
  }

  _initData() async {
    state = LoadingState.Loading;
    try {
      _appSettings = await repository.getAppSettings();
      state = LoadingState.Success;
    } catch (e) {
      print(e);
      state = LoadingState.Error;
    }
    notifyListeners();
  }

  _createOrUpdateAppSetting(String name, String value) async {
    var existingAppSetting = _getAppSetting(name);
    if (existingAppSetting != null) {
      await repository
          .updateAppSetting(existingAppSetting.copyWith(value: value));
    } else {
      await repository.addAppSetting(AppSetting(
        name: name,
        value: value,
      ));
    }
  }

  _refreshAppSettings() async {
    state = LoadingState.Loading;
    try {
      _appSettings = await repository.getAppSettings();
      state = LoadingState.Success;
    } catch (e) {
      print(e);
      state = LoadingState.Error;
    }
    notifyListeners();
  }

  AppSetting _getAppSetting(String name) {
    return _appSettings.isNotEmpty
        ? _appSettings.firstWhere((element) => element.name == name)
        : null;
  }

  String _getAppSettingValue(String name, dynamic defaultValue) {
    return _getAppSetting(name)?.value ?? defaultValue;
  }

  UnmodifiableListView<AppSetting> get appSettings =>
      UnmodifiableListView(_appSettings);

  bool get darkModeEnabled =>
      (_getAppSettingValue(sDarkModeEnabled, 'false')).toBoolean();

  String get selectedPage => _selectedPage;

  toggleAppTheme() async {
    await _createOrUpdateAppSetting(
        sDarkModeEnabled, (!darkModeEnabled).toString());
    await _refreshAppSettings();
  }

  setSelectedPage(String page) {
    this._selectedPage = page;
    _refreshAppSettings();
  }

  @override
  LoadingState state;
}
