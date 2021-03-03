import 'package:desk_focus/data/base_app_settings_dao.dart';
import 'package:desk_focus/data/database/dao/app_settings_dao.dart' as db;
import 'package:desk_focus/models/entities/app_settings.dart';
import '../webdb/app_settings_dao.dart' as web;
import 'package:flutter/foundation.dart';

class AppSettingsRepository {
  final BaseAppSettingsDao _dbDao =
      kIsWeb ? web.AppSettingsDao() : db.AppSettingsDao();

  Future addAppSetting(AppSetting appSetting) =>
      _dbDao.addAppSetting(appSetting);

  Future getAppSettings() => _dbDao.getAppSettings();

  Future updateAppSetting(AppSetting appSetting) =>
      _dbDao.updateAppSetting(appSetting);
}
