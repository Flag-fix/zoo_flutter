import 'animal.dart';

class AdapterAnimal {
  Animal animal = Animal();
  Animal fromJson(Map<String, Object> json) =>
      Animal(
          id: json["ID"] as int,
          nome: json["NOME"] as String,
          especie: json["ESPECIE"] as String,
          foto: json["FOTO"] as String,
          sexo: json["SEXO"] as String,
          dataNasc: DateTime.parse(json["DATA_NASC"] as String));

  Map<String, Object> toJson() =>
      {
        "ID": animal.id,
        "NOME": animal.nome,
        "ESPECIE": animal.especie,
        "FOTO": animal.foto,
        "SEXO": animal.sexo,
        "DATA_NASC": animal.dataNasc.toIso8601String()
      };

}