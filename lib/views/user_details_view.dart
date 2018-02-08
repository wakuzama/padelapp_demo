import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:padelapp_demo/globals/user_globals.dart' as uGlobals;
//import '';
//import 'package:padelapp_demo/list_items/person_list_item.dart';

class PersonListItem extends StatelessWidget {
//  final Map<String, dynamic> PersonData;
  const PersonListItem({Key key, this.icon, this.children}):super (key : key);
  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return new Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: new BoxDecoration(
          border: new Border(bottom: new BorderSide(color: themeData.dividerColor))
      ),
      child: new DefaultTextStyle(
        style: Theme.of(context).textTheme.subhead,
        child: new SafeArea(
          top: false,
          bottom: false,
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  width: 72.0,
                  child: new Icon(icon, color: themeData.primaryColor)
              ),
              new Expanded(child: new Column(children: children))
            ],
          ),
        ),
      ),
    );
  }
}

//class _ContactItem extends StatelessWidget {
//  _ContactItem({ Key key, this.icon, this.lines, this.tooltip, this.onPressed })
//      : assert(lines.length > 1),
//        super(key: key);
//
//  final IconData icon;
//  final List<String> lines;
//  final String tooltip;
//  final VoidCallback onPressed;
//  final Text text;
//
//  @override
//  Widget build(BuildContext context) {
//    final ThemeData themeData = Theme.of(context);
//    final Text rowChild = text;
//    final List<Widget> columnChildren = lines.sublist(0, lines.length - 1).map((String line) => new Text(line)).toList();
//    columnChildren.add(new Text(lines.last, style: themeData.textTheme.caption));
//
//    final List<Widget> rowChildren = <Widget>[
//      new Expanded(
//          child: new Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: columnChildren
//          )
//      )
//    ];
//    if (icon != null) {
//      rowChildren.add(new SizedBox(
//          width: 72.0,
//          child: new IconButton(
//              icon: new Icon(icon),
//              color: themeData.primaryColor,
//              onPressed: onPressed
//          )
//      ));
//    }
//    return new MergeSemantics(
//      child: new Padding(
//          padding: const EdgeInsets.symmetric(vertical: 16.0),
//          child: new Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: rowChildren
//          )
//      ),
//    );
//  }
//}

class ContactsDetails extends StatefulWidget {
  static const String routeName = "/views/ContactsDetails";

  @override
  ContactsDetailsState createState() => new ContactsDetailsState();
}
enum AppBarBehavior { normal, pinned, floating, snapping }


class ContactsDetailsState extends State<ContactsDetails>{
  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final double _appBarHeight = 192.0;

  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  String u_name;
    TextEditingController _controllerName = new TextEditingController();
  TextEditingController _controllerSirName = new TextEditingController();
  TextEditingController _controllerEmail = new TextEditingController();
  TextEditingController _controllerNumber = new TextEditingController();
  TextEditingController _controllerAddress = new TextEditingController();
  TextEditingController _controllerBdate = new TextEditingController();

//    getSharedPreference() async{
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    u_name = prefs.getString("u_name");
//    _controllerSirName.text = prefs.getString("u_sirname");
//    _controllerEmail.text = prefs.getString("u_email");
//    _controllerNumber.text = prefs.getString("u_phone");
//    _controllerAddress.text = prefs.getString("u_address");
//    _controllerBdate.text = prefs.getString("u_bdate");
//  }

  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: new ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        platform: Theme.of(context).platform,
    ),
    child: new Scaffold(
    key: _scaffoldKey,
    body: new CustomScrollView(
    slivers: <Widget>[
    new SliverAppBar(
    expandedHeight: _appBarHeight,
    pinned: _appBarBehavior == AppBarBehavior.pinned,
    floating: _appBarBehavior == AppBarBehavior.floating || _appBarBehavior == AppBarBehavior.snapping,
    snap: _appBarBehavior == AppBarBehavior.snapping,
    actions: <Widget>[
    new IconButton(
    icon: const Icon(Icons.create),
    tooltip: 'Edit',
    onPressed: () {
    _scaffoldKey.currentState.showSnackBar(const SnackBar(
    content: const Text('This is actually just a demo. Editing isn\'t supported.')
    ));
    },
    ),
//    new PopupMenuButton<AppBarBehavior>(
//    onSelected: (AppBarBehavior value) {
//    setState(() {
//    _appBarBehavior = value;
//    });
//    },
//    itemBuilder: (BuildContext context) => <PopupMenuItem<AppBarBehavior>>[
//    const PopupMenuItem<AppBarBehavior>(
//    value: AppBarBehavior.normal,
//    child: const Text('App bar scrolls away')
//    ),
//    const PopupMenuItem<AppBarBehavior>(
//    value: AppBarBehavior.pinned,
//    child: const Text('App bar stays put')
//    ),
//    const PopupMenuItem<AppBarBehavior>(
//    value: AppBarBehavior.floating,
//    child: const Text('App bar floats')
//    ),
//    const PopupMenuItem<AppBarBehavior>(
//    value: AppBarBehavior.snapping,
//    child: const Text('App bar snaps')
//    ),
//    ],
//    ),
    ],
    flexibleSpace: new FlexibleSpaceBar(
    title: new Text ('${uGlobals.u_name} ${uGlobals.u_sirname}', textScaleFactor: 1.6),//('${u_name.toString()}  ${_controllerSirName.text.toString()}'),
    background: new Stack(
    fit: StackFit.expand,
    children: <Widget>[
//    new Image.asset(
//    'ali_connors.jpg',
//    package: 'flutter_gallery_assets',
//    fit: BoxFit.cover,
//    height: _appBarHeight,
//    ),
    // This gradient ensures that the toolbar icons are distinct
    // against the background image.
    const DecoratedBox(
    decoration: const BoxDecoration(
    gradient: const LinearGradient(
    begin: const Alignment(0.0, -1.0),
    end: const Alignment(0.0, -0.4),
    colors: const <Color>[const Color(0x60000000), const Color(0x00000000)],
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    new SliverList(
    delegate: new SliverChildListDelegate(<Widget>[
    new PersonListItem(
    icon: Icons.call,
    children: <Widget>[
      new ListTile(
        title: new Text(uGlobals.u_phone, textScaleFactor: 1.2),
        subtitle: const Text('Mobile'),
        trailing: new Icon(Icons.message, color: Colors.indigo),
        onTap: () {
          _scaffoldKey.currentState.showSnackBar(const SnackBar(
              content: const Text('Pretend that this opened your SMS application.')
          ));
        },
      ),
//    new _ContactItem(
//    icon: Icons.message,
//    tooltip: 'Send message',
//    onPressed: () {
//    _scaffoldKey.currentState.showSnackBar(const SnackBar(
//    content: const Text('Pretend that this opened your SMS application.')
//    ));
//    },
//    lines: const <String>[
//    '',
//    'Mobile',
//    ],
//    ),
//    new _ContactItem(
//    icon: Icons.message,
//    tooltip: 'Send message',
//    onPressed: () {
//    _scaffoldKey.currentState.showSnackBar(const SnackBar(
//    content: const Text('In this demo, this button doesn\'t do anything.')
//    ));
//    },
//    lines: const <String>[
//    '(323) 555-6789',
//    'Work',
//    ],
//    ),
//    new _ContactItem(
//    icon: Icons.message,
//    tooltip: 'Send message',
//    onPressed: () {
//    _scaffoldKey.currentState.showSnackBar(const SnackBar(
//    content: const Text('Imagine if you will, a messaging application.')
//    ));
//    },
//    lines: const <String>[
//    '(650) 555-6789',
//    'Home',
//    ],
//    ),
    ],
    ),

    new PersonListItem(
      icon: Icons.contact_mail,
      children: <Widget>[
        new ListTile(
          title: new Text(uGlobals.u_mail, textScaleFactor: 1.2),
          subtitle: const Text('Active'),
          trailing: new Icon(Icons.email, color: Colors.indigo),
          onTap: () {
            _scaffoldKey.currentState.showSnackBar(const SnackBar(
                content: const Text('Pretend that this opened your Email application.')
            ));
          },
        ),
//        new _ContactItem(
//          icon: Icons.email,
//          tooltip: 'Send personal e-mail',
//          onPressed: () {
//            _scaffoldKey.currentState.showSnackBar(const SnackBar(
//                content: const Text('Here, your e-mail application would open.')
//            ));
//          },
//          lines: const <String>[
//            'ali_connors@example.com',
//            'Personal',
//          ],
//        ),
//        new _ContactItem(
//          icon: Icons.email,
//          tooltip: 'Send work e-mail',
//          onPressed: () {
//            _scaffoldKey.currentState.showSnackBar(const SnackBar(
//                content: const Text('This is a demo, so this button does not actually work.')
//            ));
//          },
//          lines: const <String>[
//            'aliconnors@example.com',
//            'Work',
//          ],
//        ),
      ],
    ),
    new PersonListItem(
      icon: Icons.location_on,
      children: <Widget>[
        new ListTile(
          title: new Text(uGlobals.u_address, textScaleFactor: 1.2),
          subtitle: const Text('Home'),
          trailing: new Icon(Icons.map, color: Colors.indigo),
          onTap: () {
            _scaffoldKey.currentState.showSnackBar(const SnackBar(
                content: const Text('Pretend that this opened your Map application.')
            ));
          },
        ),
//        new _ContactItem(
//          icon: Icons.map,
//          tooltip: 'Open map',
//          onPressed: () {
//            _scaffoldKey.currentState.showSnackBar(const SnackBar(
//                content: const Text('This would show a map of San Francisco.')
//            ));
//          },
//          lines: const <String>[
//            '2000 Main Street',
//            'San Francisco, CA',
//            'Home',
//          ],
//        ),
//        new _ContactItem(
//          icon: Icons.map,
//          tooltip: 'Open map',
//          onPressed: () {
//            _scaffoldKey.currentState.showSnackBar(const SnackBar(
//                content: const Text('This would show a map of Mountain View.')
//            ));
//          },
//          lines: const <String>[
//            '1600 Amphitheater Parkway',
//            'Mountain View, CA',
//            'Work',
//          ],
//        ),
//        new _ContactItem(
//          icon: Icons.map,
//          tooltip: 'Open map',
//          onPressed: () {
//            _scaffoldKey.currentState.showSnackBar(const SnackBar(
//                content: const Text('This would also show a map, if this was not a demo.')
//            ));
//          },
//          lines: const <String>[
//            '126 Severyns Ave',
//            'Mountain View, CA',
//            'Jet Travel',
//          ],
//        ),
      ],
    ),
    new PersonListItem(
      icon: Icons.today,
      children: <Widget>[
        new ListTile(
          title: new Text(uGlobals.u_bdate, textScaleFactor: 1.2),
          subtitle: const Text('Birthdate'),
//          trailing: new Icon(Icons.person_outline, color: Colors.indigo),
//          onTap: () {
//            _scaffoldKey.currentState.showSnackBar(const SnackBar(
//                content: const Text('Pretend that this opened your Email application.')
//            ));
//          },
        ),
//        new _ContactItem(
//          lines: const <String>[
//            'Birthday',
//            'January 9th, 1989',
//          ],
//        ),
//        new _ContactItem(
//          lines: const <String>[
//            'Wedding anniversary',
//            'June 21st, 2014',
//          ],
//        ),
//        new _ContactItem(
//          lines: const <String>[
//            'First day in office',
//            'January 20th, 2015',
//          ],
//        ),
//        new _ContactItem(
//          lines: const <String>[
//            'Last day in office',
//            'August 9th, 2015',
//          ],
//        ),
      ],
    ),
    ]),
    ),
    ],
    ),
    ),
    );
  }


}
//  final PersonData personData;
//  final double weightDifference;
//  PersonListItem (this.personData);

//  @override
//  Widget build(BuildContext context) {
////    String name = PersonData['name'];
////    String sirName = PersonData['sirName'];
////    String email = PersonData['email'];
////    String phoneNumber = PersonData['phoneNumber'];
////    String country = PersonData['country'];
////    String nic = PersonData['nic'];
//
//    return
////      new Padding(
////      padding: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//      new Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisAlignment: MainAxisAlignment.end,
//          children: [
//            new Expanded(
//              child: new Row(
//                  children: [
//                    new Text('${name.toString()}'+ " " + '${sirName.toString()}',
//                      textScaleFactor: 1.2,
//                      textAlign: TextAlign.left,
//                    ),
//                  ], crossAxisAlignment: CrossAxisAlignment.start
//              ),
//            ),
//            new Expanded(
//              child: new Row(
//                  children: [
//                    new Text(email.toString(),
//                      textScaleFactor: 1.0,
//                      textAlign: TextAlign.right,
//                      style: new TextStyle(
//                        color: Colors.grey,
//                      ),
//                    ),
//                  ], crossAxisAlignment: CrossAxisAlignment.start
//              ),
//            ),//
//            new Expanded(
//                child: new Text(
//                  phoneNumber.toString(),
//                  textScaleFactor: 0.8,
//                  textAlign: TextAlign.left,
//                )),
//            new Expanded(
//                child: new Text(
//                  country.toString(),
//                  textScaleFactor: 0.8,
//                  textAlign: TextAlign.left,
//                )),
//            new Expanded(
//                child: new Text(
//                  nic.toString(),
//                  textScaleFactor: 0.8,
//                  textAlign: TextAlign.left,
//                )),
//          ]
////      ),
//      );
//  }
//}

//class UserDetailsView extends StatefulWidget {
//  UserDetailsView({Key key, this.title}) : super(key: key);
//  final String title;
//  static const String routeName = "/views/UserDetailsView";
//  @override
//  UserDetailsViewState createState() => new UserDetailsViewState();
//}
//
//class UserDetailsViewState extends State<UserDetailsView> {
//
//  TextEditingController _controllerName = new TextEditingController();
//  TextEditingController _controllerSirName = new TextEditingController();
//  TextEditingController _controllerEmail = new TextEditingController();
//  TextEditingController _controllerNumber = new TextEditingController();
//  TextEditingController _controllerNicNumber = new TextEditingController();
////  Future<http.Response> _response;
////
////  void initState() {
////    super.initState();
////    _refresh();
////  }
////
////  void _refresh() {
////    setState(() {
////      _response = http.get('https://padelmeetdemo.firebaseio.com/personData.json'
////      );
////    });
////  }
////          'http://api.openweathermap.org/data/2.5/forecast'
////              '?q=San+Francisco&units=metric&APPID=14cc828bff4e71286219858975c3e89a'
//  getSharedPreference() async{
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    _controllerName.text = prefs.getString("u_name");
//    _controllerSirName.text = prefs.getString("u_sirname");
//    _controllerEmail.text = prefs.getString("u_email");
//    _controllerNumber.text = prefs.getString("u_phone");
//    _controllerNicNumber.text = prefs.getString("u_nic");
//  }
//
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("User Details"),
//      ),
////      floatingActionButton: new FloatingActionButton(
////        child: new Icon(Icons.refresh),
////        onPressed: _refresh,
////      ),
//      body:
////      new Center(
//      new Padding(
//      padding: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//      child: new Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisAlignment: MainAxisAlignment.end,
//          children: [
//            new Expanded(
//              child: new Row(
//                  children: [
//                    new Text(_controllerName.text.toString() + " " + _controllerSirName.text,
//                      textScaleFactor: 1.2,
//                      textAlign: TextAlign.left,
//                    ),
//                  ], crossAxisAlignment: CrossAxisAlignment.start
//              ),
//            ),
//            new Expanded(
//              child: new Row(
//                  children: [
//                    new Text(_controllerEmail.text.toString(),
//                      textScaleFactor: 1.0,
//                      textAlign: TextAlign.right,
//                      style: new TextStyle(
//                        color: Colors.grey,
//                      ),
//                    ),
//                  ], crossAxisAlignment: CrossAxisAlignment.start
//              ),
//            ),//
//            new Expanded(
//                child: new Text(
//                  _controllerNumber.text.toString(),
//                  textScaleFactor: 0.8,
//                  textAlign: TextAlign.left,
//                )),
////            new Expanded(
////                child: new Text(
////                  country.toString(),
////                  textScaleFactor: 0.8,
////                  textAlign: TextAlign.left,
////                )),
//            new Expanded(
//                child: new Text(
//                  _controllerNicNumber.text.toString(),
//                  textScaleFactor: 0.8,
//                  textAlign: TextAlign.left,
//                )),
//          ]
//      ),
//      ),
////      ),
//    );
//  }
//}

//child: new FutureBuilder(
//future: _response,
//builder: (BuildContext context, AsyncSnapshot<http.Response> response) {
//if (!response.hasData)
//return new Text('Loading...');
//else if (response.data.statusCode != 200) {
//return new Text('Could not connect to API service.');
//} else {
//Map<String, dynamic> json = JSON.decode(response.data.body);
//if (json['cod'] == 200)
//return new PersonListItem(json);
//else
//return new Text('API service error: $json.');
//}
//}
//)