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
    final intType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';
    final varType = 'VARCHAR(255) NOT NULL';
    final varFKType = 'INTEGER';

    //Tabela Cavalo
    await db.execute('''
    CREATE TABLE $tableAnimal(
    ${Animal.ID} $idType, 
    ${Animal.NOME} $textType, 
    ${Animal.ESPECIE} $textType, 
    ${Animal.FOTO} $textType, 
    ${Animal.SEXO} $textType, 
    ${Animal.DATA_NASC} $textType
    )''');
  }

  //Métodos Tabela Animal
  Future<Animal> salvarAnimal(Animal animal) async {
    final db = await instance.database;
    final id = await db.insert(tableAnimal, animal.toJson());
    if (id > 0) {
      print("Cadastrado na Tabela Animal com Sucesso! Id $id");
    } else {
      print("Erro ao cadastrar na Tabela Animal");
    }
    return animal.copy(id: id);
  }

  Future<Animal> buscarPorIdAnimal(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableAnimal,
      columns: Animal.values,
      where: '${Animal.ID} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Animal.fromJson(maps.first);
    } else {
      throw Exception('ID $id não encontrado');
    }
  }

  Future<List<Animal>> buscarTodosAnimais() async {
    final db = await instance.database;
    final orderBy = '${Animal.ID} ASC';
    final result = await db.query(tableAnimal, orderBy: orderBy);
    return result.map((json) => Animal.fromJson(json)).toList();
  }

  Future<int> atualizarTodosAnimais(Animal animal) async {
    final db = await instance.database;

    return db.update(
      tableAnimal,
      animal.toJson(),
      where: '${Animal.ID} = ?',
      whereArgs: [animal.id],
    );
  }

  Future<int> DeletarAnimalId(int id) async {
    final db = await instance.database;
    return db.delete(
      tableAnimal,
      where: '${Animal.ID} = ?',
      whereArgs: [id],
    );
  }

//Fim metodo Animal
}