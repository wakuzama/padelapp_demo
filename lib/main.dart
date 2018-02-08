//import 'package:firebase_database/firebase_database.dart';
//import 'package:flutter/material.dart';
//import 'package:padelapp_demo/logic/actions_address.dart';
//import 'package:padelapp_demo/logic/redux_core.dart';
//import 'package:flutter_redux/flutter_redux.dart';
//import 'package:padelapp_demo/repo/login.dart';
//import 'package:padelapp_demo/repo/register.dart';
//import 'package:padelapp_demo/repo/login.dart';
//import 'package:padelapp_demo/repo/home.dart';
//import 'package:padelapp_demo/repo/all.dart';
//import 'package:padelapp_demo/repo/welcome_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:padelapp_demo/routes.dart';
//import 'package:padelapp_demo/theme/style.dart';
//import 'package:redux/redux.dart';
//import 'package:padelapp_demo/views/address_view.dart';
//import 'package:padelapp_demo/views/availability_view.dart';
////import 'package:padelapp_demo/views/map_view.dart';
//import 'package:padelapp_demo/views/user_details_view.dart';

//void main() => runApp(new MyApp());
//var API_Key = "AIzaSyBUO3KKnOHAyjmv29vza-gQcxxXYz1dUpE";

void main() {
//  runApp(new Routes());
//  MapView.setApiKey(API_KEY);
  FirebaseDatabase.instance.setPersistenceEnabled(true);
  new Routes(); //  runApp(new MaterialApp());
}
//class MyApp extends StatelessWidget {
//  final Store store = new Store(stateReducer,
//      initialState: new ReduxState(
//          firebaseUser: null,
//          mainReference: null,
//          entries: new List(),
//          hasEntryBeenAdded: false,
//          lastRemovedEntry: null,
//          hasEntryBeenRemoved: false),
//      middleware: [firebaseMiddleware].toList());
//
//  @override
//  Widget build(BuildContext context) {
//    store.dispatch(new InitAction());
//    return new MaterialApp(
//      title: 'Padelmeet App',
//      theme: appTheme,
////      new ThemeData(
////        primarySwatch: Colors.green,
////      ),
//      home: new StoreProvider(
//        store: store,
//        child: new LoginPage(),//MainPage(title: "Weight Tracker"),
//      ),
//    );
//  }
//}
//© 2018 GitHub, Inc.
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//
//    return new MaterialApp(
//      title: 'Padel Meet',
//      theme: new ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      routes: <String, WidgetBuilder>{
//        '/LoginPage': (BuildContext context) => new LoginPage(),
//        '/WelcomePage': (BuildContext context) => new WelcomePage(),
////        '/pages/RegisterDlg': (BuildContext context) => new RegisterDlg(),
////        '/components/_DateTimePicker': (BuildContext context) => new _DateTimePicker(),
//        '/RegisterPage': (BuildContext context) => new RegisterPage(title: "Sign Up"),
//        '/MyHomePage': (BuildContext context) => new MyHomePage(title: "PadelMeet"),
//
//        ////for tab pages routing
////        '/FirstPage': (BuildContext context) => new FirstPage(),
////        '/SecondPage': (BuildContext context) => new SecondPage(),
////        '/ThirdPage': (BuildContext context) => new ThirdPage(),
//
//      ////for routing from drawer items
////        '/views/MapView': (BuildContext context) => new MapView(title: "Map View"),
//        '/views/AddressView': (BuildContext context) => new AddressView(title: "Address"),
//        '/views/AvailabilityView': (BuildContext context) => new AvailabilityView(title: "Availability"),
//        '/views/UserDetailsView': (BuildContext context) => new UserDetailsView(title: "User Details"),
//
//        ////for routing from views to edit pages in drawer items
//        '/pages/EditAddress': (BuildContext context) => new EditAddress(),
//        '/pages/EditAvailability': (BuildContext context) => new EditAvailability(),
//        '/pages/UserDetails': (BuildContext context) => new UserDetails(),
//        '/pages/PlayerProfile': (BuildContext context) => new PlayerProfile(title: "User Profile"),
//
//      },
//      home: new LoginPage(),//new LoginPage(title: 'Padel Meet'),
////      routes: routes,
//    );
//  }
//}
