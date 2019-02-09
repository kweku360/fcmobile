import 'package:fantasy_cup/blocs/Game/GameProvider.dart';
import 'package:fantasy_cup/data/Game/GameModel.dart';
import 'package:fantasy_cup/utility/SharedPref.dart';
import 'package:fantasy_cup/utility/TokenUtil.dart';
import 'package:fantasy_cup/widgets/buttons/simpleroundbutton.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dash();
  }
}

class Dash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final token = SharedPref();
    return Scaffold(
        appBar: AppBar(
          title: Text("DASHBOARD"),
        ),
        body: Column(children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 10.0, top: 30.0,bottom: 40),
            decoration: BoxDecoration(color: Color.fromARGB(255, 68, 177, 180)),
            child: FutureBuilder<String>(
              future: token.get("player"),
              builder: (context, snapshot) {
                //print(snapshot.data);
                String v = snapshot.data;
                return Text(v);
//        if (snapshot.data == true) {
//          return LoginForm();
//         //Navigator.pushNamed(context, '/fc/user/dashboard');
//        } else {
//          return LoginForm();
//        }
              },
            ),
          ),
          SimpleRoundButton(
            backgroundColor: Colors.red,
            onPressed: () {
              token.remove("token").then((val){
                Navigator.pushNamed(context, '/fc/login');
              });
            },
            buttonText: Text(
              "Logout",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
        ]));
  }
}
