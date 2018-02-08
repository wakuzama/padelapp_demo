import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(12.0),
      child: new Card(
        child: new Center(
          child: new Icon(Icons.message, size: 50.0, color: Colors.lightBlue),
        ),
      ),
    );
  }
}
