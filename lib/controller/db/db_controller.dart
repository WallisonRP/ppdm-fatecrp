import 'dart:io';

import 'package:path/path.dart';
import 'package:ppdm_fatecrp/model/aluno.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;

  static const table = 'alunos';
  static const columnRa = 'id';
  static const columnUser = 'user';
  static const columnModelData = 'model_data';

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
            $columnRa INTEGER PRIMARY KEY,
            $columnUser TEXT NOT NULL,
            $columnModelData TEXT NOT NULL
          )
          ''');
  }

  Future<int> insert(Aluno aluno) async {
    Database db = await instance.database;
    return await db.insert(table, aluno.toMap());
  }

  Future<List<Aluno>> queryAllUsers() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> alunos = await db.query(table);
    return alunos.map((u) => Aluno.fromMap(u)).toList();
  }

  //Para testes
  Future<int> deleteAll() async {
    Database db = await instance.database;
    return await db.delete(table);
  }
}
