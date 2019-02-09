import 'package:fantasy_cup/blocs/Game/GameProvider.dart';
import 'package:fantasy_cup/data/Game/GameModel.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class Games extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  GameProvider(
       child: GameList(),
    );
  }
}

class GameList extends StatelessWidget {
  List<String> litems = ["1", "2", "Third", "4"];
  @override
  Widget build(BuildContext context) {
    final gameBloc = GameProvider.of(context);
    return Scaffold(
        body: Builder(
            builder: (context) => Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 100,
                      padding: EdgeInsets.only(left: 10.0, top: 30.0),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 68, 177, 180)),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Container(
                              alignment: Alignment.topLeft,
                              height: 30.0,
                              width: 30.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/left-arrow.png"))),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/dog.png"))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Game List",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              gameBloc.listGames.add(5);
                              final snackBar = SnackBar(
                                  content: Text(litems[litems.length - 1]));
                              Scaffold.of(context).showSnackBar(snackBar);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: Container(
//            alignment: Alignment.topLeft,
                                height: 50.0,
                                width: 50.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/paper-bin.png"))),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Flexible(child: buildList(context))
                  ],
                )));
  }

  Widget buildList(BuildContext context) {
    final games = GameProvider.of(context);
    return StreamBuilder(
      stream: games.gameList,
      initialData: 0,
      builder: (BuildContext context, AsyncSnapshot Snapshot) {
        print("you");
        print(Snapshot.data.length);
        //return Text("$Snapshot[0].name");
        return new ListView.builder(
            itemCount: Snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(Snapshot.data[index].name + " " +Snapshot.data[index].eventid.toString());
            });
      },
    );
  }
}

//
//class GameList extends StatefulWidget{
//  final String title;
//  GameList({Key key, this.title}) : super(key: key);
//  @override
//  _GameList createState() => _GameList();
//
//}
//class _GameList extends State<GameList> {
// // List<Game> _games = games;
////  final StreamSubscription subscription = StreamTest().ctrl.stream.listen((data) => print('$data'));
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Center(
//        child: StreamBuilder(
//          stream: StreamTest().ctrl.stream,
//          initialData: 0,
//          builder: (BuildContext context,AsyncSnapshot Snapshot){
//            return Text('You hit me: ${Snapshot.data} times');
////            return Column(
////          mainAxisAlignment: MainAxisAlignment.center,
////          children: Snapshot.data.map((game)=> new Text(game.gamename)).toList()
////             );
//          },
//        )
////        Column(
////          mainAxisAlignment: MainAxisAlignment.center,
////          //children: _games.map((game)=> new Text(game.gamename)).toList()
////
////        ),
//      ),
//    );
//  }
//
//
//}
