import 'package:fantasy_cup/data/Game/GameModel.dart';
import 'dart:async';

class StreamTest{

  final StreamController ctrl = StreamController();

  StreamTest(){
//    List<Game> _games = games;
//    ctrl.sink.add(_games[0].gamename);
////    ctrl.sink.add(1234);
////    ctrl.sink.add({'a': 'element A', 'b': 'element B'});
////    ctrl.sink.add(123.45);
//
//    //
//    // We release the StreamController
//    //
    ctrl.close();
  }

}
