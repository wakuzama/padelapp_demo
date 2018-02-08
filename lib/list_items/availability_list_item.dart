import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:padelapp_demo/model/availability_entry.dart';


class AvaListItem extends StatelessWidget {
  final AvailabilityEntry availabilityEntry;
//  final double weightDifference;

  AvaListItem(this.availabilityEntry);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
          children: [
          new Expanded(
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
//          new Column(
//          children: [
            new Text('Every ' + availabilityEntry.avaDays.toString(),
              textScaleFactor: 0.7,
              textAlign: TextAlign.left,
            ),
            new Text("at " + availabilityEntry.avaPlace.toString() + " : " +availabilityEntry.avaKm.toString() + " km's away",
              textScaleFactor: 0.6,
              textAlign: TextAlign.right,
              style: new TextStyle(
              color: Colors.grey,
            ),
            ),

//          ],
//            crossAxisAlignment: CrossAxisAlignment.start,
//            mainAxisSize: MainAxisSize.min,
//          ),
              ],

          ),
          ),
            new Expanded(
                child: new Text('From : ' +
                  (availabilityEntry.avaStartTime).toString()
                    + ', To : ' + (availabilityEntry.avaEndTime).toString(),
                  textScaleFactor: 0.8,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: Colors.black38,
                  ),
//                  'From : ' +
//                    availabilityEntry.avaStartTime.toString()
//                    + ', To : ' + availabilityEntry.avaEndTime.toString(),
//                  textScaleFactor: 0.8,
//                  textAlign: TextAlign.center,
                ),),
           new Expanded(
//              child: new Row(
//              mainAxisAlignment: MainAxisAlignment.end,
//            children: <Widget>[
            child: new Text(
              availabilityEntry.avaActive.toString(),
              textScaleFactor: 0.7,
              textAlign: TextAlign.right,
                ),
//            ],),
//
          ),
        ],
      ),
    );
  }
}





//crossAxisAlignment: CrossAxisAlignment.center,
//mainAxisAlignment: MainAxisAlignment.end,
//children: [
//new Expanded(
//child: new Row(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//new Column( children: [
//new Text('Every ' + availabilityEntry.avaDays.toString(),
//textScaleFactor: 0.9,
//textAlign: TextAlign.left,
//),
//new Text(availabilityEntry.avaPlace.toString() + availabilityEntry.avaKm.toString(),
//textScaleFactor: 0.8,
//textAlign: TextAlign.right,
//style: new TextStyle(
//color: Colors.grey,
//),
//),],
//),
//],
////                  crossAxisAlignment: CrossAxisAlignment.start,
//mainAxisSize: MainAxisSize.min
//)),
//
////            new Expanded(
//new Text('From' +
//availabilityEntry.avaStartTime.toString()
//+ 'To' + availabilityEntry.avaEndTime.toString(),
//textScaleFactor: 2.0,
//textAlign: TextAlign.center,
//),
////            new Expanded(
//new Text(
//availabilityEntry.avaActive.toString(),
//textScaleFactor: 1.6,
//textAlign: TextAlign.center,
//),
//new Expanded(
//child: new Row(
//mainAxisAlignment: MainAxisAlignment.end,
//children: <Widget>[
//new Text(
//availabilityEntry.avaActive.toString(),
//textScaleFactor: 1.6,
//textAlign: TextAlign.right,
////                )),
////
//),
//],
//),
//),
//],
