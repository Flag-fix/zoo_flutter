
import 'package:dio/dio.dart';

import 'package:zoo_flutter/br/com/ifpr/atividade/app/controller/DioConfig.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/interfaces/animal_dao.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/model/animal.dart';

import '../dataBaseConnection.dart';

class AnimalDaoImpl implements AnimalDao{

  final _bd = DatabaseApp.instance;

  @override
  Future<List<Animal>> find() async{
    _bd.buscarTodosAnimais();
  }

  @override
  remove(id) async{
    _bd.DeletarAnimalId(id);
  }

  @override
  save(Animal animal) async{
    _bd.salvarAnimal(animal);
  }

}