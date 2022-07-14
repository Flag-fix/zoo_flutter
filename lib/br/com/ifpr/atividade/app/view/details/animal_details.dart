import 'package:flutter/material.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/model/animal.dart';

import 'detailsBack/animal_details_back.dart';

class AnimalDetails extends StatelessWidget {
  const AnimalDetails({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var _back = AnimalDetailsBack(context);
    Animal animal = _back.animal;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var width = constraints.biggest.width;
          var radius = width / 3;
          var heigth = constraints.biggest.height;
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(60),
              child: ListView(
                children: [
                  (Uri.tryParse(animal.foto).isAbsolute)
                      ? CircleAvatar(
                    backgroundImage: NetworkImage(animal.foto),
                    radius: radius,
                  )
                      : CircleAvatar(
                    child: Icon(
                      Icons.person,
                      size: width / 2,
                    ),
                    radius: radius,
                  ),
                  Center(
                    child: Text(
                      '${animal.nome}',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Espécie:'),
                      subtitle: Text('${animal.especie}'),
                      trailing: Container(
                        width: width / 4,
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Sexo: '),
                      subtitle: Text('${animal.sexo}'),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.arrow_back),
              onPressed: () {
                _back.goToBack();
              },
            ),
          );
        });
  }
}
