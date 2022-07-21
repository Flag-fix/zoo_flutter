import 'package:get_it/get_it.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/exceptions/domains_layer_exception.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/interfaces/animal_dao.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/model/animal.dart';



class AnimalService{
  var _dao = GetIt.I.get<AnimalDao>();

  save(Animal Animal){
    validarNome(Animal.nome);
    validarEspecie(Animal.especie);
    _dao.save(Animal);
  }

  remove(dynamic id){
    _dao.remove(id);
  }

  Future<List<Animal>> find(){
    return _dao.find();
  }

  validarNome(String nome){
    var min = 3;
    var max = 50;
    if(nome == null){
      throw new DomainLayerException("Nome é Obrigatório");
    }else if(nome.length < min){
      throw new DomainLayerException("Nome deve possuir pelo menos $min caracteres.");
    }else if(nome.length > max){
      throw new DomainLayerException("Nome não deve exceder $max caracteres.");
    }
  }

  validarEspecie(String especie){
    var min = 5;
    var max = 11;
    if(especie == null){
      throw new DomainLayerException("Espécie é Obrigatório");
    }else if(especie.length < min){
      throw new DomainLayerException("Espécie deve possuir pelo menos $min caracteres.");
    }else if(especie.length > max){
      throw new DomainLayerException("Espécie não deve exceder $max caracteres.");
    }
  }

}