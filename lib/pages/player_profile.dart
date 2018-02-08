import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:padelapp_demo/list_items/person_list_item.dart';
import 'package:padelapp_demo/model/register_entry.dart';
import 'package:padelapp_demo/globals/user_globals.dart' as uGlobals;


class PlayerProfile extends StatefulWidget {
  PlayerProfile({Key key, this.title}) : super(key: key);
  final String title;

  static const String routeName = "/pages/PlayerProfile";

  @override
  _PlayerProfileState createState() => new _PlayerProfileState();
}
final mainReferenceUser = FirebaseDatabase.instance.reference();

class _PlayerProfileState extends State<PlayerProfile> {

  List data;
  String gender = uGlobals.u_gender; //get the gender selective depending on this

//  Future<String> getData() async {
//    var response = await http.get(
//        Uri.encodeFull("https://padelmeetdemo.firebaseio.com/personData"),
//        headers: {
//          "Accept": "application/json"
//        }
//    );
//    this.setState(() {
//      data = JSON.decode(response.body);
//    });
//    print(data[1]["name"]);
//
//    return "Success!";
//  }

//  @override
//  void initState() {
////    this._loadData();
//    this.getData();
//  }

  final List<String> _maleMatchTypes = <String>['Female single matches', 'Female double mathces','Mixed matches'].toList();
  final List<String> _femaleMatchTypes = <String>['Male single matches', 'Male double mathces','Mixed matches'].toList();
  final List<String> _CatTypes = <String>['Benjamin', 'Alevin','Infantil','Juvenil','Sub-23','Absoluto','Veterano+35','Veterano+40','Veterano+45','Veterano+50','Veterano+55'].toList();

  List<String> get MatchTypes{
    if(gender == 'Male'){
      MatchTypes == _maleMatchTypes;
    }else{
      MatchTypes == _femaleMatchTypes;
    }
    return MatchTypes;
  }
  String avaMatchDrop;
  String avaCatDrop;

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _matchType;
  String _catType;

  Future<Null> _helpCategory() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      child: new AlertDialog(
        title: new Text('Choosing Your Category.!'),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Text('Only matches that are nased on your Gender will be given as options here, .'),
              new Text('the mixed matches are played in as double matches.'),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Okay'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<Null> _helpLevel() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      child: new AlertDialog(
        title: new Text('Selcet Your Category.!'),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Text('Cane give the level table with texts'),
              new Text('or'),
              new Text('Show it in an Image here'),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Okay'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
//  List<PersonData> dataSaves = new List();
//  ScrollController _listViewScrollController = new ScrollController();
//  double _itemExtent = 50.0;
//
//  _PlayerProfileState() {
//    mainReferenceUser.onChildAdded.listen(_onEntryAdded);
////    mainReferenceUser.onChildChanged.listen(_onEntryEdited);
//  }
  @override
  Widget build(BuildContext context) {
    final avaPlaceDropItems = MatchTypes
        .map((String item) =>
    new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();
    final avaCatDropItems = _CatTypes
        .map((String item) =>
    new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();

    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('Player Profile'),
//        leading: new IconButton(icon: new Icon(Icons.arrow_back),
//          tooltip: "Navigation Menu",
//          onPressed: null,),
        actions: <Widget>[new IconButton(icon: new Icon(Icons.save,color: Colors.white),
            tooltip: "Save Details",
            onPressed: ()async{
              Navigator.pop(context,"Saved");
            }),
        ],
      ),
      body: new ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        children: <Widget>[
          new Text('Player: ${uGlobals.u_name} ${uGlobals.u_sirname}', textScaleFactor: 1.6, style: new TextStyle(fontWeight: FontWeight.bold)),
      new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
      new Expanded(
        child: new ListTile(
//          leading: new Icon(Icons.pin_drop),
          leading: const Text('Match Type:'),
          trailing: new DropdownButton<String>(
            value: avaMatchDrop ,
            items: avaPlaceDropItems,
            hint: new Text('select'),
            onChanged: (String newValue) {
              setState(() {
                _matchType = newValue;
                if(newValue != null)
                  avaMatchDrop = newValue;
              });
            },
          ),
        ),
      ),const SizedBox(width: 16.0),
            new IconButton(
              icon: new Icon(Icons.help),
              tooltip: 'help me to choose?',
              onPressed: _helpCategory,
            ),
          ],),
      new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
      new Expanded(
        child: new ListTile(
//          leading: new Icon(Icons.pin_drop),
          leading: const Text('Category:'),
          trailing: new DropdownButton<String>(
            value: avaCatDrop ,
            items: avaCatDropItems,
            hint: new Text('select'),
            onChanged: (String newValue) {
              setState(() {
                _catType = newValue;
                if(newValue != null)
                  avaCatDrop = newValue;
              });
            },
          ),
        ),
      ),
      const SizedBox(width: 16.0),
      new IconButton(
        icon: new Icon(Icons.help),
        tooltip: 'What are categories?',
        onPressed: _helpLevel,
      ),
          ],),

        ],
      ),
//      new ListView.builder(
//        itemCount: data == null ? 0 : data.length,
//        itemBuilder: (BuildContext context, int index) {
//          return new Card(
//            child: new Text(data[index]["name"]),
//          );
//        },
//      ),
//      body: new ListView.builder(
//        shrinkWrap: true,
//        reverse: true,
//        controller: _listViewScrollController,
//        itemCount: dataSaves.length,
//        itemBuilder: (buildContext, index) {
//          //calculating difference
////          double difference = index == 0
////              ? 0.0
////              : weightSaves[index].weight - weightSaves[index - 1].weight;
//          return new InkWell(
////              onTap: () => _editEntry(weightSaves[index]),
//              child: new PersonListItem(dataSaves[index]));
//        },
//      ),
//      body: new Column(
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.end,
//        key: formKey,
//      children: <Widget>[
//        new Expanded(
////        autovalidate: _autovalidate,
////        onWillPop: _warnUserAboutInvalidData,
//        child: new Column(
////          padding: const EdgeInsets.symmetric(horizontal: 6.0),
//          children: <Widget>[
//            new TextFormField(
//              decoration: const InputDecoration(
////                  icon: const Icon(Icons.person_pin),
//                hintText: 'first name',
//                labelText: 'Frist Name:*',
//              ),
//              maxLines: 1,
////              validator: _validateFirstName,
////              onSaved: (String value) {
////                userData.userFName = value;
////              },
//              //validator: _validateAddressVal,
//            ),
//            new TextFormField(
//              decoration: const InputDecoration(
////                  icon: const Icon(Icons.person_pin),
//                hintText: 'last name',
//                labelText: 'Last Name:*',
//              ),
//              maxLines: 1,
////              validator: _validateLastName,
////              onSaved: (String value) {
////                userData.userLName = value;
////              },
//              //validator: _validateAddressVal,
//            ),
//            new TextFormField(
//              decoration: const InputDecoration(
////                  icon: const Icon(Icons.person_pin),
//                hintText: 'Emails are better:',
//                labelText: 'E-mail:*',
//              ),
//              maxLines: 1,
//              validator: (value) =>
//              !value.contains('@') ? 'Not a valid email.' : null,
////                onSaved: (val) => userEmail = val,
//              onSaved: (String value) {
////                userData.userEmail = value;
//              },
//              //validator: _validateAddressVal,
//            ),
//            new TextFormField(
//              decoration: const InputDecoration(
////                  icon: const Icon(Icons.person_pin),
//                hintText: 'How can people contact you?',
//                labelText: 'Contact Number:*',
//              ),
//              maxLines: 1,
////              validator: _validateContactNum,
////              onSaved: (String value) {
////                userData.userContact = value;
////              },
//              //validator: _validateAddressVal,
//            ),
//            new TextFormField(
//              decoration: const InputDecoration(
////                  icon: const Icon(Icons.person_pin),
//                hintText: 'How can people find you?',
//                labelText: 'Address:*',
//              ),
//              maxLines: 1,
////              validator: _validateAddress,
////              onSaved: (String value) {
////                userData.userAddress = value;
////              },
//              //validator: _validateAddressVal,
//            ),
//            new TextFormField(
//              decoration: const InputDecoration(
////                  icon: const Icon(Icons.person_pin),
//                hintText: 'When is the celebration?',
//                labelText: 'Birthdate:',
//              ),
//              maxLines: 1,
////              validator: _validateBirthday,
////              onSaved: (String value) {
////                userData.userBday = value;
////              },
//              //validator: _validateAddressVal,
//            ),
////            new Container(
////              padding: const EdgeInsets.all(20.0),
////              alignment: Alignment.center,
////              child: new RaisedButton(
////                child: const Text('Save'),
//////                onPressed: _handleSubmitted,
////              ),
////            ),
//            new Container(
//              padding: const EdgeInsets.only(top: 20.0),
//              child: new Text('* fields are required ',
//                  style: Theme.of(context).textTheme.caption),
//            ),
//          ],
//        ),
//        ),
//        ],
//      ),
    );
  }

//  _reviver(String key, value) {
//
//    if(key != null && value is Map && key.contains("-")){
//      return new PersonData.fromJson(value);
//    }
//    return value;
////  return new JsonDecoder(reviver).convert(source);
//  }
//
//  _toEncodable(PersonData personData) {
//    return {
//      "name": personData.name,
//      "sir_name": personData.sirName,
//      "email": personData.email,
//      "password": personData.password,
//      "phone_number": personData.phoneNumber,
//      "birthday": personData.birthday,
//      "gender": personData.gender,
//      "country": personData.country,
//      "division": personData.division,
//      "address": personData.address,
//      "postal_code": personData.postalCode,
//      "nic": personData.nic,
////      "agrees": agreed,
//    };
//  }

//  const jsonCodec = const JsonCodec(reviver: _reviver,);  //

//  Future _loadData() async {
////  var json = jsonCodec.encode(personData);
////  print("json = $json");
//
//    var url = "https://padelmeetdemo.firebaseio.com/personData.json"; //personData.json
//    var httpClient = createHttpClient();
//    var userResponse = await httpClient.get(url);
//    print("response = " + userResponse.body);
//
//    Map personDatas = jsonCodec.decode(userResponse.body);
//
//    print("personData.len" + personDatas.length.toString());
//  }

//  _onEntryAdded(Event event) {
//    setState(() {
//      dataSaves.add(new PersonData.fromSnapshot(event.snapshot));
//      dataSaves.sort((we1, we2) => we1.name.compareTo(we2.name));
//    });
//    _scrollToTop();
//  }
//  _scrollToTop() {
//    _listViewScrollController.animateTo(
//      dataSaves.length * _itemExtent,
//      duration: const Duration(microseconds: 1),
//      curve: new ElasticInCurve(0.01),
//    );
//  }
}