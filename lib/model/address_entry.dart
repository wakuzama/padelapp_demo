import 'package:firebase_database/firebase_database.dart';


//class AddressSave {
////  DateTime dateTime;
////  double weight;
//String addName;
//String addCountry;
//String addDivision;
//String addPostcode;
//String addCity;
//String address;
//String addActive;
//
//  AddressSave(this.addName, this.addCountry, this.addDivision, this.addPostcode, this.addCity, this.address, this.addActive);
//}
class AddressEntry{
//  DateTime dateTime;
//  double weight;
  String key;
  String addName;
  String addCountry;
  String addDivision;
  String addPostcode;
  String addCity;
  String address;
  String addActive;

  AddressEntry(this.addName, this.addCountry, this.addDivision, this.addPostcode, this.addCity, this.address, this.addActive);

  AddressEntry.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
//        dateTime =
//        new DateTime.fromMillisecondsSinceEpoch(snapshot.value["date"]),
        addName = snapshot.value["name"].toString(),
        addCountry = snapshot.value["country"].toString(),
        addDivision = snapshot.value["division"].toString(),
        addPostcode = snapshot.value["postcode"].toString(),
        addCity  = snapshot.value["city"].toString(),
        address = snapshot.value["address"].toString(),
        addActive = snapshot.value["active"].toString();

  toJson() {
    return {
      "name": addName,
      "country": addCountry,
      "division": addDivision,
      "postcode": addPostcode,
    "city": addCity,
    "address": address,
    "active": addActive
    };
  }
}

//class WeightSave{
//  DateTime dateTime;
//  double weight;
//  String note;
//
//  WeightSave(this.dateTime, this.weight, this.note);
//
//  toJson() {
//    return {
//      "weight": weight,
//      "date": dateTime.millisecondsSinceEpoch,
//      "note": note
//    };
//  }
//}
//
//class WeightEntry {
//  DateTime dateTime;
//  double weight;
//  String note;
//
//  WeightEntry(this.dateTime, this.weight, this.note);
//
//  toJson() {
//    return {
//      "weight": weight,
//      "date": dateTime.millisecondsSinceEpoch,
//      "note": note
//    };
//  }
//}