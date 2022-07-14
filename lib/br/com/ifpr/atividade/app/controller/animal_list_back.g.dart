// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AnimalListBack on _AnimalListBack, Store {
  final _$listaAtom =
      Atom(name: '_AnimalListBack.lista');

  @override
  Future<List<Animal>> get lista {
    _$listaAtom.reportRead();
    return super.lista;
  }

  @override
  set lista(Future<List<Animal>> value) {
    _$listaAtom.reportWrite(value, super.lista, () {
      super.lista = value;
    });
  }

  final _$_AnimalListBackActionController =
      ActionController(name: '_AnimalListBack');

  @override
  dynamic updateLista([dynamic value]) {
    final _$actionInfo = _$_AnimalListBackActionController.startAction(
        name: '_AnimalListBack.updateLista');
    try {
      return super.updateLista(value);
    } finally {
      _$_AnimalListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lista: ${lista}
    ''';
  }
}
