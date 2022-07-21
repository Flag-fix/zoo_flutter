import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/model/animal.dart';

class DatabaseApp{

  static final DatabaseApp instance = DatabaseApp._init();

  static Database _database;

  DatabaseApp._init();

  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await _initDB('bancoLocal.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db,int version) async{
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    Animal animal = Animal();
    //Tabela ANIMAL
    await db.execute('''
    CREATE TABLE $tableAnimal(
    id $idType, 
    nome $textType, 
    especie $textType, 
    foto $textType, 
    sexo $textType, 
    data_nasc $textType
    )''');
  }
}