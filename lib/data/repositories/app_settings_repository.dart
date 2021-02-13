import 'package:desk_focus/data/database/dao/app_settings_db_dao.dart';
import 'package:desk_focus/models/entities/app_settings.dart';

class AppSettingsRepository {
  final _dbDao = AppSettingsDbDao();

  Future addAppSetting(AppSetting appSetting) =>
      _dbDao.addAppSetting(appSetting);

  Future getAppSettings() => _dbDao.getAppSettings();

  Future updateAppSetting(AppSetting appSetting) =>
      _dbDao.updateAppSetting(appSetting);
}
