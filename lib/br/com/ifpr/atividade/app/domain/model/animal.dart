
final String tablePessoa = 'TB_PESSOA';

class Animal {
  static final List<String> values = [
    ID,
    NOME,
    ESPECIE,
    FOTO,
    SEXO,
    DATA
  ];

  static final String ID = 'id';
  static final String NOME = 'nome';
  static final String ESPECIE = 'especie';
  static final String FOTO = 'foto';
  static final String SEXO = 'sexo';
  static final String DATA = 'data';

  final dynamic id;
  String nome;
  String especie;
  String foto;
  String sexo;
  DateTime data;

  Animal(
      {this.id,
        this.especie,
        this.foto,
        this.sexo,
        this.data,
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
          data: data ?? this.data);

  static Animal fromJson(Map<String, Object> json) => Animal(
      id: json[ID] as int,
      nome: json[NOME] as String,
      especie: json[ESPECIE] as String,
      foto: json[FOTO] as String,
      sexo: json[SEXO] as String,
      data: DateTime.parse(json[DATA] as String));

  Map<String, Object> toJson() => {
    ID: id,
    NOME: nome,
    ESPECIE: especie,
    FOTO: foto,
    SEXO: sexo,
    DATA: data.toIso8601String()
  };
}
