import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(builder:(context) => Scaffold(
        appBar: AppBar(
          title: Text('First Route'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('Open route'),
            onPressed: () {
              // Navigate to second route when tapped.
              Navigator.pushNamed(context, '/cookbook/nav/secondroute');
            },
          ),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Second Route"),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              // Navigate back to first route when tapped.
              Navigator.pop(context);
            },
            child: Text('Go back!'),
          ),
        ),
      ),

    );
  }
}
