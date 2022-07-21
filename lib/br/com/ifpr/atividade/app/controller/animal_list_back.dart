import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/model/animal.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/services/animal_service.dart';

import '../../my_app.dart';

part 'animal_list_back.g.dart';

class AnimalListBack = _AnimalListBack with _$AnimalListBack;

abstract class _AnimalListBack with Store{
  final _service = GetIt.I.get<AnimalService>();

  @observable
  Future<List<Animal>> lista;

  @action
  updateLista([dynamic value]){
    lista = _service.find();
  }

  _AnimalListBack(){
    updateLista();
  }

  goToForm(BuildContext context, [Animal animal]){
    Navigator.of(context).pushNamed(MyApp.ZOO_FORM,arguments: animal).then(updateLista);
  }

  goToDetails(BuildContext context, Animal animal){
    Navigator.of(context).pushNamed(MyApp.ZOO_DETAILS,arguments: animal);
  }

  remove(dynamic id){
    _service.remove(id);
    updateLista();
  }

}