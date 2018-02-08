import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:padelapp_demo/repo/all.dart';
import '../tabs/first_tab.dart' as first;
import '../tabs/second_tab.dart' as second;
import '../tabs/third_tab.dart' as third;
import './drawer_items.dart';

class MyHomePage extends StatefulWidget{

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  static const String routeName = "/MyHomePage";

//  var routes = <String, WidgetBuilder>{
//    MyHomePage.routeName: (BuildContext context) =>
//        new MyHomePage(title: "sign in"),
//    MyHomePage.routeName: (BuildContext context) =>
//    new MyHomePage(title: "Padel Meet"),
//    EditAddress.routeName: (BuildContext context) =>
//    new EditAddress(title: "Address Page"),
//    EditAvailability.routeName: (BuildContext context) =>
//    new EditAvailability(
//      title: "Availability Page",
//    ),
//    UserDetails.routeName: (BuildContext context) =>
//    new UserDetails(
//      title: "Contact Page",
//    ),
//  };
//  final routes = <String, WidgetBuilder>{

//  };
  @override
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController controller;

  void initState(){
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  void dispose(){
    controller.dispose();
    super.dispose();
  }
  //int _counter = 0;

//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
  @override
  Widget build(BuildContext context) {
    //var drawer = new Drawer();
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      key: _scaffoldKey,
      drawer: new MyHomeDrawer(buildRoute: (BuildContext context) {},
        routeName: null,
//        useLightTheme: widget.useLightTheme,
//        onThemeChanged: widget.onThemeChanged,
//        timeDilation: widget.timeDilation,
//        onTimeDilationChanged: widget.onTimeDilationChanged,
      ),
      appBar: new AppBar(

        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
          title: new Text(widget.title),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.search, color: Colors.white), iconSize: 24.0,  onPressed: null),
            new IconButton(icon: new Icon(Icons.refresh, color: Colors.white),iconSize: 24.0, onPressed: null),
          ],
          bottom: new TabBar(
              controller: controller,
              tabs: <Tab>[
                //new Tab(icon: new Icon(Icons.android), text: "Sample"),
                new Tab(text: "Message"),  //icon: new Icon(Icons.message),
                new Tab(text: "Matches"), //icon: new Icon(Icons.golf_course),
                new Tab(text: "Player"), //icon: new Icon(Icons.accessibility),
              ])
      ),
      body: new TabBarView(
        controller: controller,
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        //children: <Widget>[
        //new Column(
        // Column is also layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug paint" (press "p" in the console where you ran
        // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
        // window in IntelliJ) to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //new sample.SamplePage(),
          new first.FirstPage(),
          new second.SecondPage(),
          new third.ThirdPage(),
//            new Text(
//              'You have pushed the button this many times:',
//            ),
//            new Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
          //],
          //),
        ],
      ),
    );
//      floatingActionButton: new FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: new Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
  }
}