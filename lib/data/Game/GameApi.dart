import 'package:fantasy_cup/data/Game/GameModel.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GameApi{
  GameApi();

  Future<List<Game>> getAll() async {
    final response =
    await http.get('http://10.0.2.2:8080/v1/game');

    if (response.statusCode == 200) {
      var jsonObj = json.decode(response.body);
      List<Game> gList = List<Game>();
      for(int i = 0;i<jsonObj.length;i++){
        Game game = Game.fromJson(jsonObj[i]);
        gList.add(game);
      }
      return gList;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load Games');
    }
  }
}