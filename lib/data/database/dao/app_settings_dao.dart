import 'package:desk_focus/data/database/dao/base_dao.dart';
import 'package:desk_focus/models/entities/app_settings.dart';

import '../database.dart';

class AppSettingsDao extends BaseDao {
  final dbProvider = DBProvider.provider;

  AppSettingsDao() : super(appSettingsTable);

  Future<int> addAppSetting(AppSetting appSetting) async {
    return await create(appSetting.toJson());
  }

  Future<List<AppSetting>> getAppSettings() async {
    var result = await getAll();
    return result.isNotEmpty
        ? result.map((t) => AppSetting.fromJson(t)).toList()
        : [];
  }

  Future<int> updateAppSetting(AppSetting appSetting) async {
    return await update(appSetting.toJson());
  }
}
