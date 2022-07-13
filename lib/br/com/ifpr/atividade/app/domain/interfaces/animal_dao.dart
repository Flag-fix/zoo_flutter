
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/model/animal.dart';

abstract class AnimalDao{

  save(Animal animal);

  remove(dynamic id);

  Future<List<Animal>> find();

}