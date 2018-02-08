import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/src/material/time.dart';
//import 'package:flutter/src/material/time.dart';

class AvailabilityEntry{

  String avaPlace; //for clubs
  String avaKm; //for home near
  String avaDays;
  TimeOfDay avaStartTime;
  TimeOfDay avaEndTime;
  String avaActive;
  String key;


  AvailabilityEntry(this.avaPlace, this.avaKm, this.avaDays, this.avaStartTime, this.avaEndTime, this.avaActive);
//
  AvailabilityEntry.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
//        dateTime =
//        new DateTime.fromMillisecondsSinceEpoch(snapshot.value["date"]),
        avaPlace = snapshot.value["place"].toString(),
        avaKm = snapshot.value["km's"].toString(),
        avaDays = snapshot.value["days"].toString(),
        avaStartTime = snapshot.value["start_time"],
        avaEndTime = snapshot.value["end_time"],
        avaActive  = snapshot.value["acative"].toString();
//
  toJson() {
    return {
      "place": avaPlace,
      "km's": avaKm,
      "days": avaDays,
      "start_time": avaStartTime,
      "end_time": avaEndTime,
      "active": avaActive
    };
  }
}