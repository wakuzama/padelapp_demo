import 'dart:async';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:meta/meta.dart';
import 'package:padelapp_demo/list_items/address_list_item.dart';
import 'package:padelapp_demo/logic/actions_address.dart';
import 'package:padelapp_demo/logic/redux_core.dart';
import 'package:padelapp_demo/model/address_entry.dart';
import 'package:padelapp_demo/pages/add_address_dlg.dart';
import 'package:redux/redux.dart';

@immutable
class AddressPageViewModel{
  //fields
  final String defaultAddress;
  final bool hasEntryBeenAdded;
  final Function(AddEntryAction) addEntryCallback;
  final Function() acceptEntryAddedCallback;
  final List<AddressEntry> addEntries;
  final bool hasEntryBeenRemoved;

  final Function() acceptEntryRemoved;
  final Function() undoEntryRemoval;

  //functions
  final Function(EditEntryAction) editEntryCallBack;
  final Function(RemoveEntryAction) removeEntryCallBack;

  AddressPageViewModel({
    this.addEntryCallback,
    this.defaultAddress,
    this.hasEntryBeenAdded,
    this.acceptEntryAddedCallback,
   this.undoEntryRemoval,
   this.hasEntryBeenRemoved,
   this.acceptEntryRemoved,
   this.addEntries,
   this.editEntryCallBack,
   this.removeEntryCallBack
});
}

//class AddressViewSore
class AddressView extends StatefulWidget {
  AddressView({Key key, this.title}) : super(key: key);
  final String title;


//  final store = new Store(stateReducer,
//      initialState: new ReduxState(
//          firebaseUser: null,
//          mainReference: null,
//          entries: new List(),
//          hasEntryBeenAdded: false,
//          lastRemovedEntry: null,
//          hasEntryBeenRemoved: false),
//      middleware: [firebaseMiddleware].toList());

  static const String routeName = "/views/AddressView";

  @override
  _AddressViewState createState() => new _AddressViewState();
}

final mainReference = FirebaseDatabase.instance.reference();

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

class _AddressViewState extends State<AddressView> with SingleTickerProviderStateMixin{
  List<AddressEntry> addSaves = new List();
  ScrollController _listViewScrollController;// = new ScrollController();
  double _itemExtent = 5.0;

  final store = new Store(stateReducer,
      initialState: new ReduxState(
          firebaseUser: null,
          mainReference: null,
          entries: new List(),
          hasEntryBeenAdded: false,
          lastRemovedEntry: null,
          hasEntryBeenRemoved: false),
      middleware: [firebaseMiddleware].toList());
//  var store;

//  get store => store.dispatch(new InitAction());

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
  @override
  void initState(){
    super.initState();
    _listViewScrollController = new ScrollController();
  }
  @override
  void dispose(){
    _listViewScrollController.dispose();
    super.dispose();
  }
  _AddressViewState() {
    mainReference.onChildAdded.listen(_onEntryAdded);
    mainReference.onChildChanged.listen(_onEntryEdited);
  }

  @override
  Widget build(BuildContext context) {
    store.dispatch(new InitAction());
    return new StoreProvider(
        store: store,
        child: new StoreConnector<ReduxState, AddressPageViewModel>(
      converter: (store){
        return new AddressPageViewModel(
            defaultAddress: store.state.entries.isEmpty? "Home": store.state.entries.first.address,
          hasEntryBeenAdded: store.state.hasEntryBeenAdded,
          acceptEntryAddedCallback: ()=>
              store.dispatch(new AcceptEntryAddedAction()),
          addEntryCallback: (addEntryAction) => store.dispatch(addEntryAction),
          addEntries: store.state.entries,
          removeEntryCallBack: ((removeAction) => store.dispatch(removeAction)),
          editEntryCallBack: ((editAction) => store.dispatch(editAction)),
          hasEntryBeenRemoved: store.state.hasEntryBeenRemoved,
          acceptEntryRemoved: () =>
              store.dispatch(new AcceptEntryRemovalAction()),
          undoEntryRemoval: () => store.dispatch(new UndoRemovalAction()),
        );
      },
      builder: (context, viewModel){
        if(viewModel.hasEntryBeenAdded){
          _scrollToTop();
          viewModel.acceptEntryAddedCallback();
        }else if(viewModel.hasEntryBeenRemoved) {
          new Future<Null>.delayed(Duration.ZERO, () {
            Scaffold.of(context).showSnackBar(new SnackBar(
              content: new Text("Entry Deleted."),
              action: new SnackBarAction(
                label: "UNDO",
                onPressed: () => viewModel.undoEntryRemoval(),
              ),
            ));
            viewModel.acceptEntryRemoved();
          });
//        }
//      }

//        if(viewModel.addEntries.isEmpty){
//          return new Center(
//            child: new Text("Add your address"),
//          );
//        }else{
          return new Scaffold(
            appBar: new AppBar(
              title: new Text(widget.title),
            ),
          body: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new ListView.builder(
            shrinkWrap: true,
            reverse: true,
//            controller: _listViewScrollController,
            itemCount: viewModel.addEntries.length,
            itemBuilder: (buildContext, index) {
              //calculating difference
//          double difference = index == 0
//              ? 0.0
//              : addSaves[index].weight - addSaves[index - 1].weight;
              return new InkWell(
                  onTap: () => _onEditEntryDialog(viewModel.addEntries[index], context, viewModel.editEntryCallBack, viewModel.removeEntryCallBack),
                  child: new AddListItem(viewModel.addEntries[index]));//new AddListItem(addSaves[index]));
            },
          ),
//            floatingActionButton:
            new FloatingActionButton(
              onPressed: () => _openAddEntryDialog(viewModel.defaultAddress, context, viewModel.addEntryCallback),//_addAddressSave,
              tooltip: 'Add new Address',
              child: new Icon(Icons.add),
            ),
              ],
          ),
          ),
          );
        }

//        return new Scaffold(
//      appBar: new AppBar(
//        title: new Text(widget.title),
//      ),
//      body: new ListView.builder(
//        shrinkWrap: true,
//        reverse: true,
//        controller: _listViewScrollController,
//        itemCount: addSaves.length,
//        itemBuilder: (buildContext, index) {
//          //calculating difference
//          double difference = index == 0
//              ? 0.0
//              : addSaves[index].weight - addSaves[index - 1].weight;
//          return new InkWell(
//              onTap: () => _editEntry(addSaves[index], context, viewModel.editEntryCallBack, removeEntryCallback),
//              child: new AddListItem(addSaves[index]));
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
//      ),


    ),
    );
  }
//  );
//  }
//  void _addAddressSave(AddressEntry addressSave) {
//    setState(() {
//      addSaves.add(addressSave);
//      _listViewScrollController.animateTo(
//        addSaves.length * _itemExtent,
//        duration: const Duration(microseconds: 1),
//        curve: new ElasticInCurve(0.01),
//      );
//    });
//  }
  _editEntry(AddressEntry addressEntry, BuildContext context, Function(EditEntryAction) editEntryCallBack,
      Function(RemoveEntryAction) removeEntryCallBack) async {
    Navigator
        .of(context)
        .push(
      new MaterialPageRoute(
        builder: (BuildContext context) {
          return new AddAddressDlg.edit(addressEntry);
        },
        fullscreenDialog: true,
      ),
    )
        .then((newEntry) {
      if (newEntry != null) {
        if(newEntry is EditEntryAction){
          newEntry.addressEntry.key = addressEntry.key;
          editEntryCallBack(newEntry);
        }else if(newEntry is RemoveEntryAction){
          newEntry.addressEntry.key = addressEntry.key;
          removeEntryCallBack(newEntry);
        }
//        mainReference.child(addSave.key).set(newEntry.toJson());
//        setState(() => addSaves[addSaves.indexOf(addressEntry)] = newEntry);
      }
    });
  }

  Future _openAddEntryDialog(String defaultAddress, BuildContext context,
      Function(AddEntryAction) addEntryCallback) async{
  var result = await Navigator.of(context).push(new MaterialPageRoute(
      builder: (BuildContext context) {
        return new AddAddressDlg.add(defaultAddress);
      },fullscreenDialog: true));
  if(result != null && result is AddEntryAction) {
    addEntryCallback(result);
  }
//    AddressEntry save = await
//    Navigator.of(context).push(new MaterialPageRoute<AddressEntry>(
//        builder: (BuildContext context){
//          return new AddAddressDlg.add(
//              addSaves.isNotEmpty ? addSaves.last.address: 'address');
//
//        },
//        fullscreenDialog: true));
//        if (save != null) {
//          mainReference.push().set(save.toJson());
//    _addAddressSave(save);
//    }
  }

  Future _onEditEntryDialog(AddressEntry addressEntry, BuildContext context,
      Function(EditEntryAction) editEntryCallback,
      Function(RemoveEntryAction) removeEntryCallback) async {
  Navigator.of(context).push(
    new MaterialPageRoute(
        builder: (BuildContext context){
          return new AddAddressDlg.edit(addressEntry);
        },fullscreenDialog: true,
  ),
  ).then((result) {
    if(result != null) {
      if(result is EditEntryAction) {
        result.addressEntry.key = addressEntry.key;
        editEntryCallback(result);
      }else if(result is RemoveEntryAction) {
        result.addressEntry.key = addressEntry.key;
        removeEntryCallback(result);
      }
    }
  });
}
  _onEntryAdded(Event event) {
    setState(() {
      addSaves.add(new AddressEntry.fromSnapshot(event.snapshot));
      addSaves.sort((we1, we2) => we1.addCity.compareTo(we2.addCity));
    });
    _scrollToTop();
  }

  _onEntryEdited(Event event) {
    var oldValue =
    addSaves.singleWhere((entry) => entry.key == event.snapshot.key);
    setState(() {
      addSaves[addSaves.indexOf(oldValue)] =
      new AddressEntry.fromSnapshot(event.snapshot);
      addSaves.sort((we1, we2) => we1.addCity.compareTo(we2.addCity));
    });
  }

  _scrollToTop() {
    _listViewScrollController.animateTo(
      0.0,
      duration: const Duration(microseconds: 1),
      curve: new ElasticInCurve(0.01),
    );
  }
}
