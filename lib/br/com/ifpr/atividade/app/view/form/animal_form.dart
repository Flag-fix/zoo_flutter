import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/view/appBar/appBarTelas.dart';

import '../../../my_app.dart';
import 'formBack/animal_form_back.dart';

class AnimalForm extends StatefulWidget {
  AnimalForm({Key key}) : super(key: key);

  @override
  _AnimalFormState createState() => _AnimalFormState();
}

var data = MaskTextInputFormatter(mask: '########');

class _AnimalFormState extends State<AnimalForm> {
  final _form = GlobalKey<FormState>();

  Widget fieldName(AnimalFormBack back) {
    return TextFormField(
        validator: back.validacaoNome,
        onSaved: (newValue) => back.animal.nome = newValue,
        initialValue: back.animal.nome,
        decoration: InputDecoration(
            labelText: 'Insira um Nome:',
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(15))));
  }

  Widget fieldEspecie(AnimalFormBack back) {
    return TextFormField(
        validator: back.validacaoEspecie,
        onSaved: (newValue) => back.animal.especie = newValue,
        initialValue: back.animal.especie,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: 'Espécie',
            hintText: 'Labrador',
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(15))));
  }

  Widget fieldFoto(AnimalFormBack back) {
    return TextFormField(
        onSaved: (newValue) => back.animal.foto = newValue,
        initialValue: back.animal.foto,
        decoration: InputDecoration(
            labelText: 'URL Foto',
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(15))));
  }

  Widget fieldSexo(AnimalFormBack back) {
    var ref = MaskTextInputFormatter(mask: 'Ref-######');
    return TextFormField(
        onSaved: (newValue) => back.animal.sexo = newValue,
        initialValue: back.animal.sexo,
        inputFormatters: [ref],
        decoration: InputDecoration(
            labelText: 'M/F/I',
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(15))));
  }

  String verificarData(AnimalFormBack back) {
    if (back.animal.dataNasc == null) {
      getText();
    } else {
      return DateFormat('dd/MM/yyyy').format(back.animal.dataNasc);
    }
  }

  Widget fieldData(AnimalFormBack back) {
    var data = MaskTextInputFormatter(mask: '########');
    return TextFormField(
        onTap: () {
          _selectDate(context);
          FocusScope.of(context).requestFocus(new FocusNode());
          print(context);
        },
        initialValue: verificarData(back),
        keyboardType: TextInputType.datetime,
        inputFormatters: [data],
        decoration: InputDecoration(
            hintText: '01/01/2021',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            labelText: getText()),
        onSaved: (newValue) {
          back.animal.dataNasc = currentDate;
        });
  }

  DateTime currentDate;

  Future<void> _selectDate(BuildContext context) async {
    final datainicial = DateTime.now();
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: datainicial,
        firstDate: DateTime(datainicial.year - 2),
        lastDate: DateTime(datainicial.year + 5));
    if (pickedDate != null)
      setState(() {
        currentDate = pickedDate;
      });
  }

  String getText() {
    if (currentDate == null) {
      return 'Data de Entrada';
    } else {
      return DateFormat('dd/MM/yyyy').format(currentDate);
    }
  }

  Widget salvar(AnimalFormBack _back){
    return Padding(
      padding: const EdgeInsets.only(right: 55, left: 55),
      child: Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(top: 20),
        child: ElevatedButton(
          onPressed: () {
            _form.currentState.validate();
            _form.currentState.save();
            if (_back.isValid) {
              _back.salvar();
              Navigator.of(context).pushNamed(MyApp.ZOO_LISTA);
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.save),
              Padding(padding: EdgeInsets.all(16),
                child: Text("Salvar", style: TextStyle(fontSize: 20),),
              )],
          ),
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    var _back = AnimalFormBack(context);
    return Scaffold(
      appBar:AppBarTelas("Cadastro",context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Form(
            key: _form,
            child: Column(
              children: [
                SizedBox(height: 30),
                fieldName(_back),
                SizedBox(height: 15),
                fieldEspecie(_back),
                SizedBox(height: 15),
                fieldFoto(_back),
                SizedBox(height: 15),
                fieldSexo(_back),
                SizedBox(height: 15),
                fieldData(_back),
                salvar(_back),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
