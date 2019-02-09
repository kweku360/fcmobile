import 'package:fantasy_cup/data/Game/GameApi.dart';
import 'package:fantasy_cup/data/Game/GameModel.dart';
import 'dart:async';
import 'package:rxdart/subjects.dart';

class GameBloC{

  //lets add our model
 // List<String> listr = ["one","two","three"];

  //add rxdart subject
  final BehaviorSubject<List<Game>> gameList = BehaviorSubject<List<Game>>();

  final StreamController gameController = StreamController();
//  Stream get gamestream => gameController.stream;

   GameBloC(){
    gameController.stream.listen((data){
      GameApi().getAll().then((gamelist)=>gameList.add(gamelist)
      );
    });
  }

  Sink get listGames => gameController.sink;

  Stream<List<Game>> get getAllItems => gameList.stream;

 // Stream<int> get itemCount => _itemCount.stream;

//  Stream<List<CartItem>> get items => _items.stream;

  void dispose() {
    gameController.close();
  }

}
