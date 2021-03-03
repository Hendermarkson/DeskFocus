import 'package:desk_focus/models/entities/app_settings.dart';

abstract class BaseAppSettingsDao {
  Future<int> addAppSetting(AppSetting appSetting);
  
  Future<List<AppSetting>> getAppSettings();

  Future<int> updateAppSetting(AppSetting appSetting);
}
