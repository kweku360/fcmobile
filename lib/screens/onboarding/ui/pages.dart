import 'package:fantasy_cup/widgets/buttons/simpleroundbutton.dart';
import 'package:flutter/material.dart';

final pages = [
  new PageViewModel(
      const Color(0xFF548CFF),
      'assets/join.png',
      'Sign In With FPL Account',
      'Join Fantasy Cup  with your existing FPL Account. Multiple Accounts can be added',
      ''),
  new PageViewModel(
      const Color(0xFFE4534D),
      'assets/match.png',
      'Play Any Of Our Various games',
      'Play Weekly Fantasy Cup games. Compete with other FPL players',
      ''),
  new PageViewModel(
    const Color(0xFFFF682D),
    'assets/money.png',
    'Win Amazing Cash Prices',
    'Instant Cash Out on Wins.',
    '',
  ),
];

class Page extends StatelessWidget {
  final PageViewModel viewModel;
  final double percentVisible;

  Page({
    this.viewModel,
    this.percentVisible = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: double.infinity,
        color: viewModel.color,
        child: new Opacity(
          opacity: percentVisible,
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 50.0 * (1.0 - percentVisible), 0.0),
                  child: new Padding(
                    padding: new EdgeInsets.only(bottom: 25.0),
                    child: new Image.asset(viewModel.heroAssetPath,
                        width: 200.0, height: 200.0),
                  ),
                ),
                new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30.0 * (1.0 - percentVisible), 0.0),
                  child: new Padding(
                    padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: new Text(
                      viewModel.title,
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: 'CanviarDreams',
                        fontSize: 28.0,
                      ),
                    ),
                  ),
                ),
                new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30.0 * (1.0 - percentVisible), 0.0),
                  child: new Padding(
                    padding: new EdgeInsets.only(bottom: 75.0,left: 20,right: 20),
                    child: new Text(
                      viewModel.body,
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: 'FlamanteRomaItalic',
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 80.0),
                  child: SimpleRoundButton(
                    backgroundColor: Colors.white,
                    onPressed: (){
                      Navigator.pushNamed(context, '/fc/login');
                    },
                    buttonText: Text("Get Started",style: TextStyle(
                      color: viewModel.color
                    ),),
                  ),
                )
              ]),
        ));
  }
}

class PageViewModel {
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetPath;

  PageViewModel(
    this.color,
    this.heroAssetPath,
    this.title,
    this.body,
    this.iconAssetPath,
  );
}
