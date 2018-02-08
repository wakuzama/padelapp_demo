import 'package:flutter/material.dart';


class WelcomePage extends StatefulWidget{

  static const String routeName = './WelcomePage';

  @override
  WelcomePageState createState() => new WelcomePageState();
}

class WelcomePageState extends State<WelcomePage>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
        title: new Text("Welcome")
    ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
            new Text('Welcome to Padel meet..!',
            textScaleFactor: 5.0,
              textAlign: TextAlign.center,
            ),
//        new ListTile(
            new RaisedButton(
                onPressed: _goToRegisterPage,
              highlightElevation: 2.00,
              color: Colors.redAccent,
              child: new Text('Continue Here..',
                textAlign: TextAlign.center,
                textScaleFactor: 2.0,

              ),
            ),
//        ),
      ],
        ),
    );
  }

  void _goToRegisterPage() {
    Navigator.of(context).pushNamed('/RegisterPage');
  }
}