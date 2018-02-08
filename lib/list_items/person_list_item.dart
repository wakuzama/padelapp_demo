import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:padelapp_demo/model/address_entry.dart';
import 'package:padelapp_demo/model/register_entry.dart';

//class Weather extends StatelessWidget {
//  final Map<String, dynamic> data;
//  Weather(this.data);
//  Widget build(BuildContext context) {
//    double temp = data['main']['temp'];
//    return new Text(
//      '${temp.toStringAsFixed(1)} °C',
//      style: Theme.of(context).textTheme.display4,
//    );
//  }
//}
class PersonListItem extends StatelessWidget {
  final Map<String, dynamic> PersonData;
  PersonListItem(this.PersonData);
//  final PersonData personData;
//  final double weightDifference;
//  PersonListItem (this.personData);
  @override
  Widget build(BuildContext context) {
    String name = PersonData['name'];
    String sirName = PersonData['sirName'];
    String email = PersonData['email'];
    String phoneNumber = PersonData['phoneNumber'];
    String country = PersonData['country'];
    String nic = PersonData['nic'];

    return
//      new Padding(
//      padding: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            new Expanded(
                child: new Row(
                    children: [
                      new Text('${name.toString()}'+ " " + '${sirName.toString()}',
                        textScaleFactor: 1.2,
                        textAlign: TextAlign.left,
                      ),
                    ], crossAxisAlignment: CrossAxisAlignment.start
                ),
            ),
            new Expanded(
              child: new Row(
                  children: [
                  new Text(email.toString(),
                     textScaleFactor: 1.0,
                      textAlign: TextAlign.right,
                      style: new TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  ], crossAxisAlignment: CrossAxisAlignment.start
              ),
            ),//
            new Expanded(
                child: new Text(
                  phoneNumber.toString(),
                  textScaleFactor: 0.8,
                  textAlign: TextAlign.left,
                )),
            new Expanded(
                child: new Text(
                  country.toString(),
                  textScaleFactor: 0.8,
                  textAlign: TextAlign.left,
                )),
            new Expanded(
                child: new Text(
                  nic.toString(),
                  textScaleFactor: 0.8,
                  textAlign: TextAlign.left,
                )),
          ]
//      ),
    );
  }
}
//          crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisAlignment: MainAxisAlignment.end,
//          children: [
//            new Expanded(
//                child: new Row(
//                    children: [
//                      new Text(personData.name.toString(),
//                        textScaleFactor: 0.9,
//                        textAlign: TextAlign.left,
//                      ),
//                      new Text(personData.sirName.toString(),
//                        textScaleFactor: 0.8,
//                        textAlign: TextAlign.center,
//                        style: new TextStyle(
//                          color: Colors.grey,
//                        ),
//                      ),
//                    ],
//                    crossAxisAlignment: CrossAxisAlignment.start
//                ),
//            ),
//            new Expanded(
//                child: new Column(
//                children: <Widget>[
//                  new Text(
//                  personData.address.toString(),
//                  textScaleFactor: 2.0,
//                  textAlign: TextAlign.left,
//                  ),
//                  new Text(
//                    personData.phoneNumber.toString(),
//                    textScaleFactor: 2.0,
//                    textAlign: TextAlign.left,),
//                  new Text(
//                    personData.email.toString(),
//                    textScaleFactor: 2.0,
//                    textAlign: TextAlign.left,),
//                  new Text(
//                    personData.address.toString(),
//                    textScaleFactor: 2.0,
//                    textAlign: TextAlign.left,),
//                  new Text(
//                    personData.nic.toString(),
//                    textScaleFactor: 2.0,
//                    textAlign: TextAlign.left,),
//               ],
//           )),
//            new Expanded(
//                child: new Column(
//                  children: <Widget>[
//                    new Text(
//                      personData.birthday.toString(),
//                      textScaleFactor: 2.0,
//                      textAlign: TextAlign.left,
//                    ),
//                    new Text(
//                      personData.gender.toString(),
//                      textScaleFactor: 2.0,
//                      textAlign: TextAlign.left,),
//                  ],
//                )),
//        ]),


//new Expanded(
//child: new Text(
//addressEntry.address.toString(),
//textScaleFactor: 2.0,
//textAlign: TextAlign.center,
//)),
//new Expanded(
//child: new Text(
//addressEntry.addActive.toString(),
//textScaleFactor: 1.6,
//textAlign: TextAlign.right,
//)),