import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/interfaces/animal_dao.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/model/animal.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/model/adapterAnimal.dart';

import '../../database/dataBaseConnection.dart';

class AnimalRepository implements AnimalDao{

  final _bd = DatabaseApp.instance;

  @override
  Future<List<Animal>> find() async{
    final db = await _bd.database;
    AdapterAnimal animalTypes = AdapterAnimal();
    Animal animal = Animal();
    final orderBy = '${animal.id} ASC';
    final result = await db.query(tableAnimal, orderBy: orderBy);
    return result.map((json) => animalTypes.fromJson(json)).toList();
  }

  @override
  remove(id) async{
    final db = await _bd.database;
    Animal animal = Animal();
    return db.delete(
      tableAnimal,
      where: '${animal.id} = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<bool> save(Animal animal) async{
    final db = await _bd.database;
    AdapterAnimal animalTypes = AdapterAnimal();
    int linhasAfetadas = await db.insert(tableAnimal, animalTypes.toJson());
    return linhasAfetadas > 0;
  }


}