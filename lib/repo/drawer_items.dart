
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, required;
import 'package:flutter/gestures.dart';
import 'package:padelapp_demo/model/register_entry.dart';

import 'package:http/http.dart' as http;
//import 'package:path/path.dart';

import './all.dart';

class LinkTextSpan extends TextSpan {
  LinkTextSpan({ TextStyle style, String url, String text }) : super(
      style: style,
      text: text ?? url,
      recognizer: new TapGestureRecognizer()..onTap = () {
        //launch(url);
      }
  );
}

class MyHomeDrawerHeader extends StatefulWidget {
  const MyHomeDrawerHeader({
    Key key,
  }) : super(key: key);


  @override
  _MyHomeDrawerHeaderState createState() => new _MyHomeDrawerHeaderState();
}

class _MyHomeDrawerHeaderState extends State<MyHomeDrawerHeader> with TickerProviderStateMixin {
  //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _logoHasName = true;
  bool _logoHorizontal = true;
  MaterialColor _logoColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    final double systemTopPadding = MediaQuery.of(context).padding.top;

    return new DrawerHeader(
        decoration: new FlutterLogoDecoration(
          margin: new EdgeInsets.fromLTRB(12.0, 12.0 + systemTopPadding, 12.0, 12.0),
          style: _logoHasName ? _logoHorizontal ? FlutterLogoStyle.horizontal
              : FlutterLogoStyle.stacked
              : FlutterLogoStyle.markOnly,
          lightColor: _logoColor.shade400,
          darkColor: _logoColor.shade900,
          textColor: const Color(0xFF616161),  //widget.light ? const Color(0xFF616161) : const Color(0xFF9E9E9E), //widget.useLightTheme
        ),
        duration: const Duration(milliseconds: 750),
        child: new GestureDetector(
          onLongPress: () {
            setState(() {
              _logoHorizontal = !_logoHorizontal;
              if (!_logoHasName)
                _logoHasName = true;
            });
          },
          onTap: () {
            setState(() {
              _logoHasName = !_logoHasName;
            });
          },
        )
    );
  }
}

class MyHomeDrawer extends StatefulWidget {
  const MyHomeDrawer({
    Key key,
    @required this.routeName,
    @required this.buildRoute,
  }) :
        super(key: key);

  final String routeName;
  final WidgetBuilder buildRoute;

  @override
  _MyHomeDrawerState createState() => new _MyHomeDrawerState();
}
class _MyHomeDrawerState extends State<MyHomeDrawer> {

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle aboutTextStyle = themeData.textTheme.body2;
    final TextStyle linkStyle = themeData.textTheme.body2.copyWith(
        color: themeData.accentColor);

    var routes = <String, WidgetBuilder>{
      EditAddress.routeName: (BuildContext context) => new EditAddress()
    };
    routes:
    routes;

//    void onUserItemTapped() {
//      routeName: EditAddress.routeName;
//      buildRoute: (BuildContext context) => new EditAddress();
//     void onUserItemTapped () {
//      if (routeName != null) {
//        Timeline.instantSync('Start Transition', arguments: <String, String>{
//          'from': './pages/',
//          'to': routeName
//        });
//        Navigator.pushNamed(context, routeName);
//        routeName: ContactsDemo.routeName;
//        buildRoute: (BuildContext context) => new ContactsDemo();
//      }
//     }

    final Widget userItem = new ListTile(
      leading: const Icon(Icons.account_circle),
      title: const Text('User Profile'),
      onTap: () {
        Navigator.of(context).pushNamed(ContactsDetails.routeName);
//        _detailsToObject;
      }, //_onUserItemTapped,
    );
    final Widget addressItem = new ListTile(
      leading: const Icon(Icons.person_pin_circle),
      title: const Text('Addresses'),
      onTap: (){
//        Navigator.of(context).pushNamed(EditAddress.routeName);
        Navigator.of(context).pushNamed(AddressView.routeName);
      },
      //onTap: _onAddressItemTapped,
    );
    final Widget playerProfileItem = new ListTile(
      leading: const Icon(Icons.person),
      title: const Text('Player Profile'),
      onTap: () {
        Navigator.of(context).pushNamed(PlayerProfile.routeName);
      },
    );
    final Widget availabilityItem = new ListTile(
      leading: const Icon(Icons.access_time),
      title: const Text('Availability'),
      onTap: (){
        Navigator.of(context).pushNamed(AvailabilityView.routeName);
      },
    );
    final Widget myClubsItem = new ListTile(
      leading: const Icon(Icons.favorite),
      title: const Text('My Clubs'),
      onTap: null,
    );
    final Widget blackListItem = new ListTile(
      leading: const Icon(Icons.clear),
      title: const Text('Black Listed'),
      onTap: null,
    );
    final Widget settingItem = new ListTile(
      leading: const Icon(Icons.settings),
      title: const Text('Settings'),
      onTap: (){
//        Navigator.of(context).pushNamed(MapView.routeName);
      },
    );
    final Widget aboutItem = new AboutListTile(
        icon: const FlutterLogo(),
        applicationVersion: 'April 2017 Preview',
        applicationIcon: const FlutterLogo(),
        applicationLegalese: '© 2017 The Chromium Authors',
        aboutBoxChildren: <Widget>[
          new Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: new RichText(
                  text: new TextSpan(
                      children: <TextSpan>[
                        new TextSpan(
                            style: aboutTextStyle,
                            text: 'Flutter is an early-stage, open-source project to help developers'
                                'build high-performance, high-fidelity, mobile apps for '
                                '${defaultTargetPlatform == TargetPlatform.iOS
                                ? 'multiple platforms'
                                : 'iOS and Android'} '
                                'from a single codebase. This gallery is a preview of '
                                "Flutter's many widgets, behaviors, animations, layouts, "
                                'and more. Learn more about Flutter at '
                        ),
                        new LinkTextSpan(
                            style: linkStyle,
                            url: 'https://flutter.io'
                        ),
                        new TextSpan(
                            style: aboutTextStyle,
                            text: '.\n\nTo see the source code for '
                                ' app, please visit the '
                        ),
                        new LinkTextSpan(
                            style: linkStyle,
                            url: 'https://goo.gl/iv1p4G',
                            text: 'flutter github repo'
                        ),
                        new TextSpan(
                            style: aboutTextStyle,
                            text: '.'
                        )
                      ]
                  )
              )
          )
        ]
    );

    final List<Widget> allDrawerItems = <Widget>[


      new MyHomeDrawerHeader(),
      userItem,
      addressItem,
      playerProfileItem,
      availabilityItem,
      myClubsItem,
      blackListItem,
      //lightThemeItem,
      //darkThemeItem,
      const Divider(),
      settingItem,
      //mountainViewItem,
      //cupertinoItem,
      const Divider(),
    ];

    //allDrawerItems.addAll(textSizeItems);

//    allDrawerItems..addAll(<Widget>[
//      const Divider(),
//      //animateSlowlyItem,
//      const Divider(),
//      const Divider(),
//    ]);

    allDrawerItems.addAll(<Widget>[
      //sendFeedbackItem,
      aboutItem,
    ]);

    return new Drawer(
        child: new ListView(primary: false, children: allDrawerItems));
  }
}
//Future<String> _detailsToObject() async {
//  var url = 'https://padelmeetdemo.firebaseio.com/personData.json'; //personData.json
////  var httpClient = createHttpClient();
//  var userResponse = await http.get(url);
//
//  Map personData = JSON.decode(userResponse.body);
////  var det = new PersonData.fromJson(personData);
//  print(["name"]);
//
//  return "Success!";
//}
//_reviver(key, value) {
//
//  if(key != null && value is Map && key.contains("-")){
//    return new PersonData.fromJson(value);
//  }
//  return value;
////  return new JsonDecoder(reviver).convert(source);
//}

//_toEncodable(PersonData personData) {
//  return {
//    "name": personData.name,
//    "sir_name": personData.sirName,
//    "email": personData.email,
//    "password": personData.password,
//    "phone_number": personData.phoneNumber,
//    "birthday": personData.birthday,
//    "gender": personData.gender,
//    "country": personData.country,
//    "division": personData.division,
//    "address": personData.address,
//    "postal_code": personData.postalCode,
//    "nic": personData.nic,
////      "agrees": agreed,
//  };
//}

//const jsonCodec = const JsonCodec(reviver: _reviver, toEncodable: _toEncodable);
//
//Future _loadData() async {
////  var json = jsonCodec.encode(personData);
////  print("json = $json");
//
//  var url = "https://padelmeetdemo.firebaseio.com/personData.json?print=pretty"; //personData.json
//  var httpClient = createHttpClient();
//  var userResponse = await httpClient.get(url);
////  print("response = " + userResponse.body);
//
//  Map personDatas = JSON.decode(userResponse.body);
//
////  print("personData.len" + personDatas.length.toString());
//  String name = personDatas['name'];
//  print(name);
//}