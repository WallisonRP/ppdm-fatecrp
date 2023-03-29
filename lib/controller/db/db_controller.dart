import 'dart:io';

import 'package:ppdm_fatecrp/model/aluno.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'users';
  static final columnId = 'id';
  static final columnUser = 'name';
  static final columnModelData = 'model_data';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static late Database _database;
  Future<Database> get database async {
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnUser TEXT NOT NULL,
            $columnModelData TEXT NOT NULL
          )
          ''');
  }

  Future<int> insert(Student student) async {
    Database db = await instance.database;
    
    return await db.insert(table, student.toMap());
  }

  Future<int> insertAllStudents(List<Student> students ) async {
    Database db = await instance.database;
    return 1;
  }

  Future<int> queryStudentByID(int id) async {
    Database db = await instance.database;
        List<String> columnsToSelect = [
      DatabaseHelper.columnId,
      DatabaseHelper.columnUser,
      DatabaseHelper.columnModelData,
    ];
    int rowId = id;
    String whereString = '${DatabaseHelper.columnId} = ?';
    List<dynamic> whereArguments = [rowId];
List<Map> result = await db.query(
        DatabaseHelper.table,
        columns: columnsToSelect,
        where: whereString,
        whereArgs: whereArguments);

        // result.forEach((row) => print(row));
        // print(result.length);
    return result.length;
  }

  Future<List<Student>> queryAllStudents() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> users = await db.query(table);
    return users.map((student) => Student.fromMap(student)).toList();
  }

  Future<int> deleteAll() async {
    Database db = await instance.database;
    return await db.delete(table);
  }
}
