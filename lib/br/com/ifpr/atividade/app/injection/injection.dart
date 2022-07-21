
import 'package:get_it/get_it.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/interfaces/animal_dao.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/services/animal_service.dart';

import '../domain/repository/animal_repository.dart';

setupInjection()async{
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<AnimalDao>(AnimalRepository());
  getIt.registerSingleton<AnimalService>(AnimalService());
}