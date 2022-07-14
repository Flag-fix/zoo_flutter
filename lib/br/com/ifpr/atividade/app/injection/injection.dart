import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/database/connectionApi/animal_dao_api.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/interfaces/animal_dao.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/services/animal_service.dart';

setupInjection()async{
  GetIt getIt = GetIt.I;

  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerSingleton<AnimalDao>(AnimalDaoApi());
  getIt.registerSingleton<AnimalService>(AnimalService());
}