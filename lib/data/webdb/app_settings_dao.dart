import 'package:desk_focus/data/base_app_settings_dao.dart';
import 'package:desk_focus/models/entities/app_settings.dart';

class AppSettingsDao implements BaseAppSettingsDao {
  List<AppSetting> _appSettings = [];

  @override
  Future<int> addAppSetting(AppSetting appSetting) {
    _appSettings.add(appSetting);
  }

  @override
  Future<List<AppSetting>> getAppSettings() {
    return Future.value(_appSettings);
  }

  @override
  Future<int> updateAppSetting(AppSetting appSetting) {
    var index =
        _appSettings.indexWhere((element) => appSetting.id == element.id);
    if (index == -1) {
      throw ('Could not find element with id ${appSetting.id}');
    }
    _appSettings[index] = appSetting;
  }
}
