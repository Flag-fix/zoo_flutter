import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/model/animal.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/services/animal_service.dart';

class AnimalFormBack{
  var _service = GetIt.I.get<AnimalService>();
  var _validate = AnimalService();
  bool _nameIsValid;
  bool _especieIsValid;

  bool get isValid =>_nameIsValid && _especieIsValid;

  Animal animal;

  AnimalFormBack(BuildContext context){
    var param = ModalRoute.of(context).settings.arguments;
    animal = (param == null) ? Animal() : param;
  }

  salvar() async{
    await _service.save(animal);
  }

  String validacaoNome(String nome){
    try{
      _validate.validarNome(nome);
      _nameIsValid = true;
    }catch(e){
      _nameIsValid = false;
      return e.toString();
    }
  }

  String validacaoEspecie(String especie){
    try{
      _validate.validarEspecie(especie);
      _especieIsValid = true;
    }catch(e){
      _especieIsValid = false;
      return e.toString();
    }
  }


}