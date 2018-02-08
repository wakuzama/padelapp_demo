import 'dart:async';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:padelapp_demo/list_items/availability_list_item.dart';
import 'package:padelapp_demo/model/availability_entry.dart';
import 'package:padelapp_demo/pages/add_availability_dlg.dart';

class AvailabilityView extends StatefulWidget {
  AvailabilityView({Key key, this.title}) : super(key: key);
  final String title;

  static const String routeName = "/views/AvailabilityView";

  @override
  _AvailabilityViewState createState() => new _AvailabilityViewState();
}

final mainReferenceAva = FirebaseDatabase.instance.reference();

//  @override
//  Widget build(BuildContext context) {
//    return new Container(
//      padding: const EdgeInsets.all(12.0),
//      child: new Card(
//        child: new Center(
//          child: new Icon(Icons.message, size: 50.0, color: Colors.lightBlue),
//        ),
//      ),
//    );
//  }

class _AvailabilityViewState extends State<AvailabilityView> {
  List<AvailabilityEntry> avaSaves = new List();
  ScrollController _listViewScrollController = new ScrollController();
  double _itemExtent = 5.0;

//  void _addAddressSave(WeightSave save) {
//    setState(() {
////      strings.add("new address");
////      weightSaves.add(new WeightSave(new DateTime.now(), new Random().nextInt(100).toDouble()));
//    });
//  }

//  Future _openAddEntryDialog() async {
//    WeightSave save = await Navigator.of(context).push(new MaterialPageRoute<WeightSave>(
//        builder: (BuildContext context) {
//          return new AddAddressDlg();
//        },
//        fullscreenDialog: true
//    ));
//    if (save != null) {
//      _addAddressSave(save);
//    }
//  }
  _AvailabilityViewState() {
    mainReferenceAva.onChildAdded.listen(_onEntryAdded);
    mainReferenceAva.onChildChanged.listen(_onEntryEdited);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView.builder(
        shrinkWrap: true,
        reverse: true,
        controller: _listViewScrollController,
        itemCount: avaSaves.length,
        itemBuilder: (buildContext, index) {
          //calculating difference
//          double difference = index == 0
//              ? 0.0
//              : addSaves[index].weight - addSaves[index - 1].weight;
          return new InkWell(
              onTap: () => _editEntryAva(avaSaves[index]),
              child: new AvaListItem(avaSaves[index]));
        },
//        children:
//        weightSaves.map((WeightSave weightSave) {
//          double difference = weightSaves.first == weightSave
//              ? 0.0
//              : weightSave.weight -
//              weightSaves[weightSaves.indexOf(weightSave) - 1].weight;
//          return new WeightListItem(weightSave, difference);
//          }).toList(),
//          return new Row(
//            children: [
//              new Text(string)
//            ],
//          );
//        }).toList(),
      ),

      floatingActionButton: new FloatingActionButton(
        onPressed: _openAddEntryDialog,//_addAddressSave,
        tooltip: 'Add new availability',
        child: new Icon(Icons.add),
      ),
    );
  }

  void _avaAvailabilitySave(AvailabilityEntry avaSave) {
    setState(() {
      avaSaves.add(avaSave);
      _listViewScrollController.animateTo(
        avaSaves.length * _itemExtent,
        duration: const Duration(microseconds: 1),
        curve: new ElasticInCurve(0.01),
      );
    });
  }
  _editEntryAva(AvailabilityEntry avaSave) {
    Navigator
        .of(context)
        .push(
      new MaterialPageRoute<AvailabilityEntry>(
        builder: (BuildContext context) {
          return new AddAvailabilityDlg.edit(avaSave);
        },
        fullscreenDialog: true,
      ),
    )
        .then((newEntry) {
      if (newEntry != null) {
//        mainReferenceAva.child(avaSave.key).set(newEntry.toJson());
        setState(() => avaSaves[avaSaves.indexOf(avaSave)] = newEntry);
      }
    });
  }

  Future _openAddEntryDialog() async{
    AvailabilityEntry save = await
    Navigator.of(context).push(new MaterialPageRoute<AvailabilityEntry>(
        builder: (BuildContext context){
          return new AddAvailabilityDlg.add(
              avaSaves.isNotEmpty ? avaSaves.last.avaPlace: 'place');

        },
        fullscreenDialog: true));
    if (save != null) {
      mainReferenceAva.push().set(save.toJson());
    _avaAvailabilitySave(save);
    }
  }
  _onEntryAdded(Event event) {
    setState(() {
      avaSaves.add(new AvailabilityEntry.fromSnapshot(event.snapshot));
      avaSaves.sort((we1, we2) => we1.avaPlace.compareTo(we2.avaPlace));
    });
    _scrollToTop();
  }

  _onEntryEdited(Event event) {
    var oldValue =
    avaSaves.singleWhere((entry) => entry.key == event.snapshot.key);
    setState(() {
      avaSaves[avaSaves.indexOf(oldValue)] =
      new AvailabilityEntry.fromSnapshot(event.snapshot);
      avaSaves.sort((we1, we2) => we1.avaPlace.compareTo(we2.avaPlace));
    });
  }

  _scrollToTop() {
    _listViewScrollController.animateTo(
      avaSaves.length * _itemExtent,
      duration: const Duration(microseconds: 1),
      curve: new ElasticInCurve(0.01),
    );
  }
}
