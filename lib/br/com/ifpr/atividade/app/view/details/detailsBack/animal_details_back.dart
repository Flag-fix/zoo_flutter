import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/domain/model/animal.dart';


class AnimalDetailsBack{
  BuildContext context;
  Animal animal;

  AnimalDetailsBack(this.context){
    animal = ModalRoute.of(context).settings.arguments;
  }

  goToBack(){
    Navigator.of(context).pop();
  }

  _launchApp(String url, Function (BuildContext context) showModalError) async {
    await canLaunch(url) ? launch(url) : showModalError(context);
  }


}