final String tableAnimal = 'TB_ANIMAL';

class Animal {
  static final List<String> values = [
    ID,
    NOME,
    ESPECIE,
    FOTO,
    SEXO,
    DATA_NASC
  ];

  static final String ID = 'id';
  static final String NOME = 'nome';
  static final String ESPECIE = 'especie';
  static final String FOTO = 'foto';
  static final String SEXO = 'sexo';
  static final String DATA_NASC = 'data';

  final dynamic id;
  String nome;
  String especie;
  String foto;
  String sexo;
  DateTime dataNasc;

  Animal(
      {this.id,
        this.especie,
        this.foto,
        this.sexo,
        this.dataNasc,
        this.nome});

  Animal copy({
    int id,
    String nome,
    String especie,
    String foto,
    String sexo,
    DateTime data,
  }) =>
      Animal(
          id: id ?? this.id,
          nome: nome ?? this.nome,
          especie: especie ?? this.especie,
          foto: foto ?? this.foto,
          sexo: sexo ?? this.sexo,
          dataNasc: data ?? this.dataNasc);

  static Animal fromJson(Map<String, Object> json) => Animal(
      id: json[ID] as int,
      nome: json[NOME] as String,
      especie: json[ESPECIE] as String,
      foto: json[FOTO] as String,
      sexo: json[SEXO] as String,
      dataNasc: DateTime.parse(json[DATA_NASC] as String));

  Map<String, Object> toJson() => {
    ID: id,
    NOME: nome,
    ESPECIE: especie,
    FOTO: foto,
    SEXO: sexo,
    DATA_NASC: dataNasc.toIso8601String()
  };
}
