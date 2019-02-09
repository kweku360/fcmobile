
import 'package:fantasy_cup/data/Game/GameModel.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fantasy_cup/blocs/StreamTest.dart';

void main() => runApp(Games());

class Games extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Fantasy Cup",
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: GameList(title: "Fantasy Cup Yes",),
    );
  }

}

class GameList extends StatefulWidget{
  final String title;
  GameList({Key key, this.title}) : super(key: key);
  @override
  _GameList createState() => _GameList();

}
class _GameList extends State<GameList> {
 // List<Game> _games = games;
//  final StreamSubscription subscription = StreamTest().ctrl.stream.listen((data) => print('$data'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
          stream: StreamTest().ctrl.stream,
          initialData: 0,
          builder: (BuildContext context,AsyncSnapshot Snapshot){
            return Text('You hit me: ${Snapshot.data} times');
//            return Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: Snapshot.data.map((game)=> new Text(game.gamename)).toList()
//             );
          },
        )
//        Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          //children: _games.map((game)=> new Text(game.gamename)).toList()
//
//        ),
      ),
    );
  }


}

