import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/controller/animal_list_back.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/model/animal.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/view/appBar/appBarLista.dart';


class AnimalList extends StatefulWidget {
  @override
  _AnimalListState createState() => _AnimalListState();
}

class _AnimalListState extends State<AnimalList> {
  final _back = AnimalListBack();

  CircleAvatar avatar(String url) {
    return (Uri.tryParse(url).isAbsolute)
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : CircleAvatar(child: Icon(Icons.person));
  }

  Widget editar(Function editar) {
    return IconButton(
        onPressed: editar, icon: Icon(Icons.edit), color: Colors.deepOrange);
  }

  Widget remover(BuildContext context, Function remove) {
    return IconButton(
      icon: Icon(Icons.delete),
      color: Colors.red,
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Excluir"),
              content: Text("Confirma Exclusão?"),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Não")),
                FlatButton(onPressed: remove, child: Text("Sim")),
              ],
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarLista(context,_back),
        body: Padding(
          padding: const EdgeInsets.only(top: 35,left: 10,right: 10),
          child: Observer(
            builder: (context) {
              return FutureBuilder(
                  future: _back.lista,
                  builder: (context, index) {
                    if (!index.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      List<Animal> _list = index.data;
                      return
                        ListView.builder(
                          padding: const EdgeInsets.all(2.0),
                          itemCount: _list.length,
                          itemBuilder: (context, i) {
                            return Card(
                              child: ListTile(
                                leading: avatar(_list[i].foto),
                                title: Text(
                                  _list[i].nome,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () {
                                  _back.goToDetails(context, _list[i]);
                                },
                                subtitle: Text(_list[i].sexo),
                                trailing: Container(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      editar(() {
                                        _back.goToForm(context, _list[i]);
                                      }),
                                      remover(context, () {
                                        _back.remove(_list[i].id);
                                        Navigator.of(context).pop();
                                      }),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                    }
                  });
            },
          ),
        ));
  }
}
