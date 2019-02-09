import 'package:fantasy_cup/cookbook/forms/form.dart';
import 'package:fantasy_cup/cookbook/forms/formvalues.dart';
import 'package:fantasy_cup/screens/Auth/Login.dart';
import 'package:fantasy_cup/screens/Auth/testscreen1.dart';
import 'package:fantasy_cup/screens/User/Dashboard.dart';
import 'package:fantasy_cup/screens/onboarding/start.dart';
import 'package:flutter/material.dart';
import 'package:fantasy_cup/cookbook/navigation/nav.dart';
import 'package:fantasy_cup/cookbook/http/http.dart';
import 'package:fantasy_cup/screens/Game/Games.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    //main app entry route
    '/': (BuildContext context) => new LoginForm(),
    //Fantasy Cup Routes
    '/fc/login': (BuildContext context) => new LoginForm(),
    '/fc/start': (BuildContext context) => new Start(),
    '/fc/user/dashboard': (BuildContext context) => new Dashboard(),

    //Cookbook Routes
    '/cookbook/nav/secondroute': (BuildContext context) => new SecondRoute(),
    '/cookbook/http': (BuildContext context) => new httpTest(post: fetchPost()),
    '/cookbook/form': (BuildContext context) => new MyForm(),
    '/cookbook/formvalues': (BuildContext context) => new formvalues(),
  };

  Routes () {
    runApp(new MaterialApp(
      title: 'Fantasy Cup',
      routes: routes,
      initialRoute: '/',
      //home: new FirstRoute(),
    ));
  }
}