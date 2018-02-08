import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(12.0),
      child: new Card(
        child: new Center(
          child: new Icon(Icons.accessibility,
              size: 50.0, color: Colors.lightBlue),
        ),
      ),
    );
  }
}
