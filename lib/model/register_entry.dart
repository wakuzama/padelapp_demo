import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';

class PersonData {
//  String key;
  String uid;
  String name;
  String sirName;
  String email;
  String password;
  String phoneNumber;
  String address;
  String country;
  String division;
  String gender;
  String birthday;
  String postalCode;
  String nic;
//  bool agreed = true;

  PersonData({
      this.uid,
      this.name,
      this.sirName,
      this.email,
      this.password,
      this.phoneNumber,
      this.address,
      this.country,
      this.division,
      this.gender,
      this.birthday,
      this.postalCode,
      this.nic,
//      this.agreed
  });
//  PersonData.fromSnapshot(DataSnapshot snapshot): key = snapshot.key,
//        dateTime =
////        new DateTime.fromMillisecondsSinceEpoch(snapshot.value["date"]),
//        name = snapshot.value["name"].toString(),
//        sirName = snapshot.value["sir name"].toString(),
//        email = snapshot.value["email"].toString(),
//        password = snapshot.value["password"].toString(),
//        phoneNumber = snapshot.value["phoneNumber"].toString(),
//        country = snapshot.value["country"].toString(),
//        division = snapshot.value["division"].toString(),
//        postalCode = snapshot.value["postcode"].toString(),
//        gender  = snapshot.value["gender"].toString(),
//        address = snapshot.value["address"].toString(),
//        nic = snapshot.value["nic"].toString(),
//        birthday = snapshot.value["birthday"].toString();

  PersonData.fromJson(Map value){
    this.name = value['name'];
    this.sirName = value['SirName'];
    this.phoneNumber = value['phone_nember'];
    this.email = value['email'];
//    this.gender = value["gender"];
    this.address = value['address'];
    this.birthday = value['birthday'];
//    address = value["address"];
  }
  _detailsToObject() async {
    var url = 'https://padelmeetdemo.firebaseio.com/personData.json'; //personData.json
    var httpClient = createHttpClient();
    var userResponse = await httpClient.get(url);

    Map personData = JSON.decode(userResponse.body);
    var det = new PersonData.fromJson(personData);
    print(det.name);
  }

  Map toJson() {
    return {
      "uid": uid,
      "name": name,
      "sir_name": sirName,
      "email": email,
      "password": password,
      "phone_number": phoneNumber,
      "address": address,
      "country": country,
      "division": division,
      "gender": gender,
      "birthday": birthday,
      "postal_code": postalCode,
      "nic": nic,
//      "agrees": agreed,
    };
  }
}
//
//
//Future loadCrossword() async {
//  String jsonCrossword = await _loadCrosswordAsset();
//  print(jsonCrossword);
//}

//_reviver(key, value) {
//
//  if(key != null && value is Map && key.contains("-")){
//    return new PersonData.fromJson(value);
//  }
//  return value;
////  return new JsonDecoder(reviver).convert(source);
//}
//
//_toEncodable(PersonData personData) {
//  return {
//    "uid": personData.uid,
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
//}

//const jsonCodec = const JsonCodec(reviver: _reviver, toEncodable: _toEncodable);
//
//Future _loadData() async {
////  var json = jsonCodec.encode(personData);
////  print("json = $json");
//
//  var url = "https://padelmeetdemo.firebaseio.com/personData.json"; //personData.json
//  var httpClient = createHttpClient();
//  var userResponse = await httpClient.get(url);
//
// print("response = " + userResponse.body);
//
//  Map personDatas = jsonCodec.decode(userResponse.body);
//
//  print("personData.len" + personDatas.length.toString());
//}
// body
//class RegisterEntry {
//  String key;
//  DateTime dateTime;
//  double weight;
//  String note;
//
//  RegisterEntry(this.dateTime, this.weight, this.note);
//
//  RegisterEntry.fromSnapshot(DataSnapshot snapshot)
//      : key = snapshot.key,
//        dateTime =
//        new DateTime.fromMillisecondsSinceEpoch(snapshot.value["date"]),
//        weight = snapshot.value["weight"].toDouble(),
//        note = snapshot.value["note"];
//
//  toJson() {
//    return {
//      "weight": weight,
//      "date": dateTime.millisecondsSinceEpoch,
//      "note": note
//    };
//  }
//}


