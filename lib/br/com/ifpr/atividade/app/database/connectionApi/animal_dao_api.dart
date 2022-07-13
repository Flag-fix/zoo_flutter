
import 'package:dio/dio.dart';

import 'package:zoo_flutter/br/com/ifpr/atividade/app/controller/DioConfig.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/interfaces/animal_dao.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/model/animal.dart';

class AnimalDaoApi implements AnimalDao{

  String path = "animals";

  @override
  Future<List<Animal>> find() async{
    try{
      var dio = DioConfig.builderConfig();
      final Response response = await dio.get(path);
      if(200 == response.statusCode){
        var result = (response.data as List).map((item) {
          return Animal.fromJson(item);
        }).toList();
        return result;
      }else{
        return <Animal>[];
      }
    }catch(e){
      return <Animal>[];
    }
  }

  @override
  remove(id) async{
    try{
      var dio = DioConfig.builderConfig();
      String pathMethod = path+"/"+id.toString();
      await dio.delete(pathMethod);
    }on DioError catch (e){
      return e;
    }


  }

  @override
  save(Animal animal) async{
    try{
      var dio = DioConfig.builderConfig();
      if(animal.id == null){
        await dio.post(path, data: animal.toJson());
      }else{
        String pathMethod = path+"/"+animal.id.toString();
        await dio.put(pathMethod, data: animal.toJson());
      }
    }on DioError catch (e){
      return e;
    }
  }

}