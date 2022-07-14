import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/view/details/animal_details.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/view/form/animal_form.dart';
import 'package:zoo_flutter/br/com/ifpr/atividade/app/view/list/animal_list.dart';

import 'app/style/app_images.dart';
import 'app/view/homePage/my_home_page.dart';


class MyApp extends StatelessWidget {
  static const HOME = 'home';
  static const ZOO_LISTA = 'lista';
  static const ZOO_FORM = 'cavalo-form';
  static const ZOO_DETAILS = 'cavalo-details';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação para Controle de Entrada de Zoos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: {
        HOME: (context) => MyHomePage(),
        ZOO_LISTA: (context) => AnimalList(),
        ZOO_FORM: (context) => AnimalForm(),
        ZOO_DETAILS: (context) => AnimalDetails()
      },
      home: AnimatedSplashScreen(
        splash: Image.asset(AppImages.sistemaZoo),
        nextScreen: MyHomePage(),
        splashIconSize: 300,
        splashTransition: SplashTransition.scaleTransition,
        duration: 5*1000,
        pageTransitionType: PageTransitionType.bottomToTop,
      ),
    );
  }
}