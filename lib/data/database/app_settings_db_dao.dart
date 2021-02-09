import 'package:desk_focus/models/entities/app_settings.dart';

import 'database.dart';

class AppSettingsDbDao {
  final dbProvider = DBProvider.provider;

  Future<int> addAppSetting(AppSetting appSetting) async {
    final db = await dbProvider.database;
    return await db.insert(appSettingsTable, appSetting.toJson());
  }

  Future<List<AppSetting>> getAppSettings() async {
    final db = await dbProvider.database;
    var res = await db.query(appSettingsTable);
    return res.isNotEmpty
        ? res.map((t) => AppSetting.fromJson(t)).toList()
        : [];
  }

  Future<int> updateAppSetting(AppSetting appSetting) async {
    final db = await dbProvider.database;
    return await db.update(appSettingsTable, appSetting.toJson(),
        where: 'id = ?', whereArgs: [appSetting.id]);
  }
}
