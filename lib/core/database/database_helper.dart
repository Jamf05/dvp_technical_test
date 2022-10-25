import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dvp_technical_test/core/utils/database_utils.dart';
import 'package:dvp_technical_test/core/utils/update_application_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class SchemaDB {
  static const userTableName = "user";
  static const userTable = '''
      CREATE TABLE IF NOT EXISTS user (
        id_cognito TEXT PRIMARY KEY,
        user_name TEXT NOT NULL,
        email TEXT NOT NULL,
        birthdate TEXT NOT NULL,
        session_status INTEGE NOT NULL
      );
    ''';
  static final tables = {
    userTableName: userTable,
  };

  static final toMigrate = [
    userTableName,
  ];

  static final toRebuild = [];

  static final excludeTables = [
    "android_metadata",
    "sqlite_sequence",
  ];
}

class DatabaseHelper {
  static const _databaseName = "dvp_technical_test.db";
  static const _databaseVersion = 1;

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    _database = await _initDatabase();
    return _database;
  }

  Future<Database>? _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    final appVersion = await _getAppVersion();
    final databaseVersion = UpdateApplicationUtils.appVersionToInt(appVersion);
    Database database = await openDatabase(path,
        version: databaseVersion,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
        onDowngrade: _onDowngrade);
    return database;
  }

  Future<void> _onCreate(Database db, int version) async {
    log("Create DB, version: $version", name: "insertDB");
    for (var item in SchemaDB.tables.values.toList()) {
      await db.execute(item);
    }
  }

  Future<int> insertDB(String table, Map<String, dynamic> values) async {
    log("${table.toString()}, ${values.toString()}", name: "insertDB");
    Database? db = await database;
    int? id = await db!.insert(table, values);
    return id;
  }

  Future<int> rawInsertOrReplace(
    String table,
    String colums,
    List<dynamic> values,
  ) async {
    Database? db = await database;
    String singValues = "";

    for (var i in values) {
      singValues += "?,";
    }

    singValues = singValues.substring(0, singValues.length - 1);
    var res;
    log("INSERT OR REPLACE INTO $table ($colums) VALUES($singValues)",
        name: "rawInsertDB");
    res = await db?.rawInsert('''
      INSERT OR REPLACE INTO $table ($colums) VALUES($singValues)
      ''', values);
    return res;
  }

  Future selectQuery(String table, List<String> cols, String where,
      List<dynamic> whereArgs) async {
    Database? db = await database;
    log("${table.toString()}, ${cols.toString()}, ${where.toString()}",
        name: "selectDB");
    List<Map>? maps = await db?.query(table,
        columns: cols,
        where: where.isNotEmpty ? where : null,
        whereArgs: whereArgs);
    if (maps!.isNotEmpty) {
      return maps;
    }

    return null;
  }

  Future<void> update(String table, Map<String, dynamic> values, String where,
      List<dynamic> whereArgs) async {
    Database? db = await database;
    log("${table.toString()}, ${values.toString()}, ${where.toString()}",
        name: "updateDB");
    final res =
        await db?.update(table, values, where: where, whereArgs: whereArgs);
    log("$res", name: "updateDB-res");
  }

  Future<void> execute(String? sql, {Database? db}) async {
    log(sql ?? "", name: "executeDB");
    Database? db_ = db ?? await database;
    await db_?.execute(sql ?? "");
  }

  Future<void> delete(String table, {Database? db}) async {
    String sql = "DROP TABLE IF EXISTS $table;";
    Database? db_ = db ?? await database;
    await db_?.execute(sql);
    log(sql, name: "deleteDB");
  }

  Future<String> _getAppVersion() async {
    PackageInfo info = await PackageInfo.fromPlatform();
    log(info.version, name: "PVersion");
    return info.version;
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    log("form $oldVersion to $newVersion", name: "DBVersion-set");
    log("======== OnUpgradeDB ========", name: "DB");
    double oldV = oldVersion / 10;
    double newV = newVersion / 10;
    int difference = (oldV.truncate() - newV.truncate()).abs();
    if (difference == 0) {
    } else if (difference >= 1) {
      await _onUpgradeQuery(db, newVersion);
    } else if (difference >= 10) {
      await _onUpgradeQuery(db, newVersion);
    }
  }

  Future<void> _onUpgradeQuery(Database db, int version) async {
    if (!await doMigration(db)) await _clearAllTable(db);
    log("Upgrade DB, version: $version", name: "DB");
    // String table = '''
    // ''';

    // await db.execute(table);
    await _onCreate(db, version);
  }

  FutureOr<void> _onDowngrade(
      Database db, int oldVersion, int newVersion) async {
    log("form $oldVersion to $newVersion", name: "DBVersion-set");
    log("======== onDowngrade ========", name: "DB");
    double oldV = oldVersion / 10;
    double newV = newVersion / 10;
    int difference = (oldV.truncate() - newV.truncate()).abs();
    if (difference == 0) {
    } else if (difference >= 1) {
      await _onDowngradeQuery(db, newVersion);
    } else if (difference >= 10) {
      await _onDowngradeQuery(db, newVersion);
    }
  }

  Future<void> _onDowngradeQuery(Database db, int version) async {
    if (!await doMigration(db)) await _clearAllTable(db);
    log("Downgrade DB, version: $version", name: "DB");
    // String table = '''
    // ''';

    // await db.execute(table);
    await _onCreate(db, version);
  }

  Future<void> _clearAllTable(Database db) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();

    List<String> tableNames = (await db
            .query('sqlite_master', where: 'type = ?', whereArgs: ['table']))
        .map((row) => row['name'].toString())
        .toList();

    for (var t in SchemaDB.excludeTables) {
      tableNames.remove(t);
    }
    for (var item in tableNames) {
      try {
        await delete(item, db: db);
      } catch (e) {
        continue;
      }
    }
  }

  Future<bool> doMigration(Database db) async {
    for (var t in SchemaDB.toMigrate) {
      try {
        final r = await db
            .rawQuery("SELECT sql FROM sqlite_master WHERE name = '$t'");
        if (r.isEmpty) {
          log("MIGRATION FAILED", name: "DB");
          return false;
        }
        if (!r.first.containsKey("sql")) {
          log("MIGRATION FAILED", name: "DB");
          return false;
        }
        if (!DatabaseUtils.schemaCompare(r.first["sql"].toString(), SchemaDB.tables[t])) {
          log("MIGRATION FAILED", name: "DB");
          return false;
        }
      } catch (e) {
        log("MIGRATION FAILED", name: "DB");
        return false;
      }
    }

    for (var item in SchemaDB.toRebuild) {
      try {
        await delete(item, db: db);
        await execute(SchemaDB.tables[item], db: db);
      } catch (e) {
        log("MIGRATION FAILED", name: "DB");
        return false;
      }
    }

    log("SUCCESSFUL MIGRATION", name: "DB");
    return true;
  }
}
