import 'dart:async';
import 'dart:math';

import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:padelapp_demo/logic/actions_address.dart';
import 'package:padelapp_demo/model/address_entry.dart';


class AddAddressDlg extends StatefulWidget{
  final String initialAddress;
final AddressEntry addressEntryEdit;
  AddAddressDlg.add(this.initialAddress) : addressEntryEdit = null;

  AddAddressDlg.edit(this.addressEntryEdit)
      : initialAddress  = addressEntryEdit.address;


  @override
  _AddAddressDlgState createState() {
    if (addressEntryEdit != null) {
      return new _AddAddressDlgState(addressEntryEdit.addName, addressEntryEdit.addCountry, addressEntryEdit.addDivision, addressEntryEdit.addCity,
          addressEntryEdit.address, addressEntryEdit.addPostcode, addressEntryEdit.addActive);
    } else {
      return new _AddAddressDlgState(
          'Home', 'Spain', 'Div 1', 'City', initialAddress, '12345', 'Active');
    }
  }
}
//
//  @override
//  _AddAddressDlgState createState() => new _AddAddressDlgState('','','','','','',false);


class _AddAddressDlgState extends State<AddAddressDlg>{
//  DateTime _dateTime = new DateTime.now();
//  double _weight = 00.00;
//  TextEditingController _textController;
  TextEditingController _textControllerAddress;
  TextEditingController _textControllerCity;
  TextEditingController _textControllerPostcode;
  String _note;
//  String addNameDrop = 'Home';
//  String addCountryDrop = 'Spain';
//  String addDivisionDrop = 'Div 1';
  String _addName;
  String _addCountry;
  String _addDivision;
  String _addPostcode;
  String _addCity;
  String _address;
  String _addActive;
  bool switchValue = false;

  _AddAddressDlgState(this._addName, this._addCountry, this._addDivision, this._addPostcode, this._addCity, this._address, this._addActive);

  @override
  void initState() {
//    _textController = new TextEditingController(text: _note);
    _textControllerAddress = new TextEditingController(text: _address);
    _textControllerCity = new TextEditingController(text: _addCity);
    _textControllerPostcode = new TextEditingController(text: _addPostcode);
//    _textController = new TextEditingController(text: _note);
//    _textController = new TextEditingController(text: _note);
    super.initState();
  }

  final List<String> _allGenderTypes = <String>['Home', 'Office', 'Travel', 'Other',].toList();
  String addNameDrop;
  final List<String> _allCountry = <String>[
  'Spain',
  'France',
  'England',
  'Germany',
  'England',
  'UK',
  'Sweden',].toList();
  String addCountryDrop;
  final List<String> _allDivisionTypes = <String>[
  'Div 1',
  'Div 2',
  'Div 3',
  'Div 4',
  'Div 5',
  'Div 6',
  'Div 7',
  ].toList();
  String addDivisionDrop;

  Widget _createAppBar(BuildContext context) {
    bool isInEditMode = widget.addressEntryEdit != null;

    return new AppBar(
      title: isInEditMode ? const Text("Address Edit") : const Text("Address Entry"),
      actions: [
        isInEditMode ? new FlatButton(
          onPressed: () {
            Navigator.of(context).pop(
                new RemoveEntryAction(widget.addressEntryEdit));
          },
          child: new Text('DELETE',
              style: Theme
                  .of(context)
                  .textTheme
                  .subhead
                  .copyWith(color: Colors.white)),
        ) : new Container(),
        new FlatButton(
          onPressed: () {
            AddressEntry entry = new AddressEntry(_addName, _addCountry, _addDivision, _addPostcode, _addCity, _address, _addActive);
            var returnedAction = isInEditMode
                ? new EditEntryAction(entry)
                : new AddEntryAction(entry);
            Navigator.of(context).pop(returnedAction);
          },
          child: new Text('SAVE',
              style: Theme
                  .of(context)
                  .textTheme
                  .subhead
                  .copyWith(color: Colors.white)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
//    var _dateTime;
    final addNameDropItems = _allGenderTypes
        .map((String item) =>
    new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();
    final addCountryDropItems = _allCountry
        .map((String item) =>
    new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();
    final addDivisionDropItems = _allDivisionTypes
        .map((String item) =>
    new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();
    return new Scaffold(
      appBar: _createAppBar(context),
//      appBar: new AppBar(
//          title: widget.addressEntryEdit == null
//              ? const Text("New entry")
//              : const Text("Edit entry"),
//        actions:
//          new FlatButton(
//              onPressed: () {
//                //TODO: Handle save
//                Navigator
//                .of(context)
//                    .pop(new AddressEntry(_addName, _addCountry, _addDivision, _addPostcode, _addCity, _address, _addActive));
//              },
//              child: new Text('Save',
//                  style: Theme
//                      .of(context)
//                      .textTheme
//                      .subhead
//                      .copyWith(color: Colors.white))),
//          new FlatButton(
//              onPressed: () {
//                //TODO: Handle save
////                Navigator
////                    .of(context)
////                    .pop(new AddressEntry(addName, addCountry, addDivision, addPostcode, addCity, address, addActive));
//              },
//              child: new Text('Delete',
//                  style: Theme
//                      .of(context)
//                      .textTheme
//                      .subhead
//                      .copyWith(color: Colors.white))),
//        ],
//      ),
      body: new Column(
        children: <Widget>[
          new ListTile(
            leading: new Icon(Icons.pin_drop),
            title: const Text('Address Name:'),
            trailing: new DropdownButton<String>(
              value: addNameDrop,
              hint: new Text('gender'),
              items: addNameDropItems,
              onChanged: (newValue) {
                setState(() {
                  _addName = newValue;
                  if(newValue != null)
                    addNameDrop = newValue;
                });
              },
//              items: <String>['Home', 'Office', 'Travel', 'Other']
//                  .map((String value) {
//                return new DropdownMenuItem<String>(
//                  value: value,
//                  child: new Text(value),
//                );
//              }).toList(),
            ),
          ),
//              const SizedBox(
//                height: 12.0,
//              ),
          new ListTile(
            leading: new Icon(Icons.flag),
            title: const Text('Country:'),
            trailing: new DropdownButton<String>(
              value: addCountryDrop,
                  hint: const Text('Choose'),
              items: addCountryDropItems,
              onChanged: (String newValue) {
                setState(() {
                  _addCountry = newValue;
                  if(newValue != null)
                    addCountryDrop = newValue;
                });
              },
//              items: <String>[].map((String value) {
//                return new DropdownMenuItem<String>(
//                  value: value,
//                  child: new Text(value),
//                );
//              }).toList(),
            ),
          ),
//              const SizedBox(
//                height: 12.0,
//              ),
          new ListTile(
            leading: new Icon(Icons.flag),
            title: const Text('Division:'),
            trailing: new DropdownButton<String>(
              value: addDivisionDrop,
                  hint: const Text('Choose'),
              items: addDivisionDropItems,
              onChanged: (String newValue) {
                setState(() {
                  _addDivision = newValue;
                  if(newValue != null)
                    addDivisionDrop = newValue;
                });
              },
//              items: <String>[].map((String value) {
//                return new DropdownMenuItem<String>(
//                  value: value,
//                  child: new Text(value),
//                );
//              }).toList(),
            ),
          ),
          new ListTile(
//            leading: new Icon(Icons.speaker_notes, color: Colors.grey[500]),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: 'Street Address *',
              ),
              controller: _textControllerAddress,
              onChanged: (value) => _address = value,
            ),
          ),
          new ListTile(
//            leading: new Icon(Icons.speaker_notes, color: Colors.grey[500]),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: 'Postal Code *',
              ),
              controller: _textControllerPostcode,
              onChanged: (value) => _addPostcode = value,
            ),
          ),

          new ListTile(
//            leading: new Icon(Icons.speaker_notes, color: Colors.grey[500]),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: 'City ',
              ),
              controller: _textControllerCity,
              onChanged: (value) => _addCity = value,
            ),
          ),
          new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                child: new Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: new Text('Keep this Address Active',
                      style: Theme.of(context).textTheme.body2),
                ),
              ),
              //const SizedBox(width: 16.0),
//                  new Expanded(
              new Switch(
                  value: switchValue,
                  onChanged: (bool value) {
                    setState(() {
                      if(value == true){
                        _addActive = 'Active';
                      }else{
                        _addActive = 'De-Active';
                      }
//                      _addActive = value;
                    });
                  }
              ),
//                  ),
            ],
          ),
//          new ListTile(
//            leading: new Icon(Icons.today, color: Colors.grey[500]),
//            title: new DateTimeItem(
//              dateTime: _dateTime,
//              onChanged: (dateTime) => setState(() => _dateTime = dateTime),
//            ),
//          ),
//          new ListTile(
////            leading: new Image.asset(
////              "assets/scale-bathroom.png",
////              color: Colors.grey[500],
////              height: 24.0,
////              width: 24.0,
////            ),
//            title: new Text(
//              "$_weight kg",
//            ),
//            onTap: () => _showWeightPicker(context),
//          ),
//          new ListTile(
//            leading: new Icon(Icons.speaker_notes, color: Colors.grey[500]),
//            title: new TextField(
//              decoration: new InputDecoration(
//                hintText: 'Optional note',
//              ),
//              controller: _textController,
//              onChanged: (value) => _note = value,
//            ),
//          ),
        ],
      ),
      //new Text("Foo"),
    );
  }

//  _showWeightPicker(BuildContext context) {
//    showDialog(
//      context: context,
//      child: new NumberPickerDialog.decimal(
//        minValue: 1,
//        maxValue: 150,
//        initialDoubleValue: _weight,
//        title: new Text("Enter your weight"),
//      ),
//    ).then((value) {
//      if (value != null) {
//        setState(() => _weight = value);
//      }
//    });
//  }
}


////////////////// date and time /////////////////

class DateTimeItem extends StatelessWidget {
  DateTimeItem({Key key, DateTime dateTime, @required this.onChanged})
      : assert(onChanged != null),
        date = dateTime == null
            ? new DateTime.now()
            : new DateTime(dateTime.year, dateTime.month, dateTime.day),
        time = dateTime == null
            ? new DateTime.now()
            : new TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        super(key: key);

  final DateTime date;
  final TimeOfDay time;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new InkWell(
            onTap: (() => _showDatePicker(context)),
            child: new Padding(
                padding: new EdgeInsets.symmetric(vertical: 8.0),
                child: new Text(new DateFormat('EEEE, MMMM d').format(date))),
          ),
        ),
        new InkWell(
          onTap: (() => _showTimePicker(context)),
          child: new Padding(
              padding: new EdgeInsets.symmetric(vertical: 8.0),
              child: new Text('$time')),
        ),
      ],
    );
  }

  Future _showDatePicker(BuildContext context) async {
    DateTime dateTimePicked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: date.subtract(const Duration(days: 20000)),
        lastDate: new DateTime.now());

    if (dateTimePicked != null) {
      onChanged(new DateTime(dateTimePicked.year, dateTimePicked.month,
          dateTimePicked.day, time.hour, time.minute));
    }
  }

  Future _showTimePicker(BuildContext context) async {
    TimeOfDay timeOfDay =
    await showTimePicker(context: context, initialTime: time);

    if (timeOfDay != null) {
      onChanged(new DateTime(
          date.year, date.month, date.day, timeOfDay.hour, timeOfDay.minute));
    }
  }
}