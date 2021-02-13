import 'package:flutter/foundation.dart';

import '../database.dart';

class BaseDao {
  final String _table;
  final dbProvider = DBProvider.provider;

  BaseDao(this._table);

  @protected
  Future<dynamic> create(Map<String, dynamic> entity) async {
    final db = await dbProvider.database;
    return await db.insert(_table, entity);
  }

  Future<Map<String, dynamic>> getOne(dynamic id) async {
    final db = await dbProvider.database;
    var result = await db.query(_table, where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? result.first : null;
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    final db = await dbProvider.database;
    return await db.query(_table);
  }

  Future<dynamic> update(Map<String, dynamic> entity) async {
    final db = await dbProvider.database;
    return await db
        .update(_table, entity, where: 'id = ?', whereArgs: [entity['id']]);
  }

  Future<dynamic> delete(dynamic id) async {
    final db = await dbProvider.database;
    return db.delete(_table, where: 'id = ?', whereArgs: [id]);
  }
}
