import 'package:flutter/widgets.dart';
import 'package:fantasy_cup/blocs/Game/GameBloC.dart';

class GameProvider extends InheritedWidget{

  final GameBloC gameBloc;

  GameProvider({
    Key key,
    GameBloC gameBloc,
    Widget child,
  })  : gameBloc = gameBloc ?? GameBloC(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static GameBloC of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(GameProvider) as GameProvider)
          .gameBloc;
}
