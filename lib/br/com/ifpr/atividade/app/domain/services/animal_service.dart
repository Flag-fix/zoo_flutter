import 'package:get_it/get_it.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/interfaces/animal_dao.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/model/animal.dart';



class AnimalService{
  var _dao = GetIt.I.get<AnimalDao>();

  save(Animal Animal){
    validarNome(Animal.nome);
    validarEspecie(Animal.especie);
    validarTelefone(Animal.contato);
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

  validarEspecie(String referencia){
    var min = 5;
    var max = 11;
    if(referencia == null){
      throw new DomainLayerException("Referência é Obrigatório");
    }else if(referencia.length < min){
      throw new DomainLayerException("Referência deve possuir pelo menos $min caracteres.");
    }else if(referencia.length > max){
      throw new DomainLayerException("Referência não deve exceder $max caracteres.");
    }
  }

  validarTelefone(String tel){
    var format = RegExp(r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$');

    if(tel == null){
      throw new DomainLayerException('O telefone é obrigatório.');
    }else if(!format.hasMatch(tel)){
      throw new DomainLayerException('Formato inválido. O formato deve ser (99) 9 9999-9999.');
    }
  }

  validarData(String data){
    if(data == null){
      throw new DomainLayerException("Data é Obrigatória");
    }
  }

}