import 'package:flutter/material.dart';


TextStyle textStyle = const TextStyle(
    color: const Color(0X263238),
    fontSize: 16.0,
    fontWeight: FontWeight.normal);

ThemeData appTheme = new ThemeData(
  hintColor: Colors.blueGrey,
  //other parameters
);

Color textFieldColor = const Color.fromRGBO(179,229,252,0.2); //(255, 255, 255, 0.1);

Color primaryColor = const Color.fromRGBO(33,150,243,1.0);

TextStyle buttonTextStyle = const TextStyle(
    color: const Color.fromRGBO(255, 255, 255, 0.8),
    fontSize: 14.0,
    fontFamily: "Roboto",
    fontWeight: FontWeight.bold);

//for register page
TextStyle headingStyle = new TextStyle(
  color: Colors.blue,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);
//DecorationImage backgroundImage = new DecorationImage(
//  image: new ExactAssetImage('assets/signup-screen-background.png'), //asset goes here
//  fit: BoxFit.cover,
//);
//for the login page images
DecorationImage backgroundImage = new DecorationImage(
  image: new ExactAssetImage('assets/login-screen-background.png'),
  fit: BoxFit.cover,
);

ExactAssetImage logo = new ExactAssetImage("assets/logo_launch.png");

//for the signup page images

