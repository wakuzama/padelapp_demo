import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:padelapp_demo/model/address_entry.dart';


class AddListItem extends StatelessWidget {
  final AddressEntry addressEntry;
//  final double weightDifference;

  AddListItem(this.addressEntry);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
        new Expanded(
            child: new Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              new Text(addressEntry.addName.toString(),
                textScaleFactor: 0.9,
                textAlign: TextAlign.left,
              ),
              new Text(addressEntry.addCity.toString(),
                textScaleFactor: 0.8,
                textAlign: TextAlign.right,
                style: new TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
//                crossAxisAlignment: CrossAxisAlignment.start
            )),
        new Expanded(
            child: new Text(
              addressEntry.address.toString(),
              textScaleFactor: 2.0,
              textAlign: TextAlign.center,
            )),
        new Expanded(
            child: new Text(
              addressEntry.addActive.toString(),
              textScaleFactor: 1.6,
              textAlign: TextAlign.right,
            )),
      ]),
    );
  }
}