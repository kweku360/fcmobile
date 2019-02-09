

class Game {
  final int id;
  final String name;
  final String duration;
  final int eventid;
  final int playercount;
  final int maxplayers;
  final double gametax;
  final double entryfee;

  Game({this.duration, this.eventid, this.playercount, this.maxplayers, this.gametax, this.entryfee, this.name,this.id});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      name: json['name'],
      maxplayers: json['maxplayers'],
      duration: json['duration'],
      eventid: json['eventid'],
      gametax: json['gametax'],
      playercount: json['playercount'],
      entryfee: json['entryfee'],
    );
  }

}

