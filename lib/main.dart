//import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
//import 'package:page_transition/page_transition.dart';

import 'br/com/ifpr/atividade/app/style/app_images.dart';


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
        ZOO_LISTA: (context) => ZooList(),
        ZOO_FORM: (context) => ZooForm(),
        ZOO_DETAILS: (context) => ZooDetails()
      },
      home: AnimatedSplashScreen(
        splash: Image.asset(AppImages.zakSistemas),
        nextScreen: MyHomePage(),
        splashIconSize: 300,
        splashTransition: SplashTransition.scaleTransition,
        duration: 5*1000,
        pageTransitionType: PageTransitionType.bottomToTop,
      ),
    );
  }
}
