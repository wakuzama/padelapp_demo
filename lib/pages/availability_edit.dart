import 'dart:async';

import 'package:flutter/material.dart';

class EditAvailability extends StatefulWidget {
  EditAvailability({Key key, this.title}) : super(key: key);
  final String title;

  static const String routeName = "/pages/EditAvailability";

  @override
  _EditAvailabilityState createState() => new _EditAvailabilityState();
}

//class AvailableData {
//  String addNameDrop = 'Home';
//  String addCountryDrop = 'Spain';
//  String postalCode = '';
//  String addProvince = '';
//  String addCity = '';
//  String addressVal = '';
//  bool switchValue = true;
//}

class _EditAvailabilityState extends State<EditAvailability> {
  TimeOfDay _fromTime = new TimeOfDay.now();
  TimeOfDay _toTime = new TimeOfDay.now();
  final List<String> _allAddressTypes = <String>['Home', 'Office', 'Travel', 'Other'];
  final List<String> _allClubs = <String>['Club 1', 'Club 2', 'Club 3', 'Club 4','Club 5'];
  String _addresses = 'Home';
  String _clubs = 'Club 1';

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  String addNameDrop = 'Home';
  String addClubDrop = 'Spain';
  bool switchValue = false;

  bool checkboxValueA = true;

  bool checkboxValueMonday = false;
  bool checkboxValueTuesday = false;
  bool checkboxValueWednsday = false;
  bool checkboxValueThursday = false;
  bool checkboxValueFriday = false;
  bool checkboxValueSaturday = false;
  bool checkboxValueSunday = false;

//  bool checkboxValueB = false;
  int radioValueAddress = 0;
  int radioValueDays = 0;

//  bool switchValue = false;
  int radioValue = 0;

// Method setting value.
  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  void handleAddressRadioValueChanged(int value) {
    setState(() {
      radioValueAddress = value;
    });
  }

  void handleDaysRadioValueChanged(int value) {
    setState(() {
      radioValueDays = value;
//      if (value == 3) {
//        //code for enabling check boxes
//      }
//      return; //return value to pass to check box group
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text("Addresses"),
      ),
      body: new Form(
        //key: _formKey,
        //autovalidate: _autovalidate,
        //onWillPop: _warnUserAboutInvalidData,
        child: new ListView(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          children: <Widget>[
//place
            new Container(
              padding: const EdgeInsets.only(top: 10.0),
              child:
              new Text('Place', style: Theme.of(context).textTheme.subhead),
            ),
            new Column(
              children: <Widget>[
                new RadioListTile(
                    value: 0,
                    title: new Text('Close to an Address'),
                    groupValue: radioValueAddress,
                    onChanged: handleAddressRadioValueChanged),
//
                new RadioListTile(
                    value: 1,
                    title: new Text('Close to a Club'),
                    groupValue: radioValueAddress,
                    onChanged: handleAddressRadioValueChanged
                ),],
            ),
            new InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Place',
                hintText: 'Choose an Address or Club',
              ),
              isEmpty: _addresses == null,
              child: new DropdownButton<String>(
                value: _addresses,
                isDense: true,
                onChanged: (String newValue) {
                  setState(() {
                    _addresses = newValue;
                  });
                },
                items: _allAddressTypes.map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
              ),
            ),
//days
            new Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: new Text('Days', style: Theme.of(context).textTheme.subhead),
            ),
            new Column(
              children: <Widget>[
                new RadioListTile(
                    value: 0,
                    title: new Text('Everyday'),
                    groupValue: radioValueDays,
                    onChanged: handleDaysRadioValueChanged),
                new RadioListTile(
                    value: 1,
                    title: new Text('WeekEnds'),
                    groupValue: radioValueDays,
                    onChanged: handleDaysRadioValueChanged),
                new RadioListTile(
                    value: 2,
                    title: new Text('All Weekdays'),
                    groupValue: radioValueDays,
                    onChanged: handleDaysRadioValueChanged),
                new RadioListTile(
                    value: 3,
                    title: new Text('Selected Days'),
                    groupValue: radioValueDays,
                    onChanged: handleDaysRadioValueChanged),
              ],
            ),
            new Column(
              children: <Widget>[
                new CheckboxListTile(
                    value: checkboxValueMonday,
                    title: const Text('Monday'),
                    onChanged: (bool value) {
                      setState(() {
                        checkboxValueMonday = value;
                      });
                    }),
                new CheckboxListTile(
                    value: checkboxValueTuesday,
                    title: const Text('Tuesday'),
                    onChanged: (bool value) {
                      setState(() {
                        checkboxValueTuesday = value;
                      });
                    }),
                new CheckboxListTile(
                    value: checkboxValueWednsday,
                    title: const Text('Wedensday'),
                    onChanged: (bool value) {
                      setState(() {
                        checkboxValueWednsday = value;
                      });
                    }),
                new CheckboxListTile(
                    value: checkboxValueThursday,
                    title: const Text('Thursday'),
                    onChanged: (bool value) {
                      setState(() {
                        checkboxValueThursday = value;
                      });
                    }),
                new CheckboxListTile(
                    value: checkboxValueFriday,
                    title: const Text('Friday'),
                    onChanged: (bool value) {
                      setState(() {
                        checkboxValueFriday = value;
                      });
                    }),
                new CheckboxListTile(
                    value: checkboxValueSaturday,
                    title: const Text('Saturday'),
                    onChanged: (bool value) {
                      setState(() {
                        checkboxValueSaturday = value;
                      });
                    }),
                new CheckboxListTile(
                    value: checkboxValueSunday,
                    title: const Text('Sunday'),
                    onChanged: (bool value) {
                      setState(() {
                        checkboxValueSunday = value;
                      });
                    }),
              ],
            ),

            //time
            new Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: new Text('Time', style: Theme.of(context).textTheme.subhead),
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new _DateTimePicker (
                    labelText: 'From',
                    selectedTime: _fromTime,
                    selectTime: (TimeOfDay time) {
                      setState(() {
                        _fromTime = time;
                      });
                    },
                  ),
                ),
                const SizedBox(
                    width: 16.0
                ),
                new Expanded(
                  child: new _DateTimePicker(
                    labelText: 'To',
                    selectedTime: _toTime,
                    selectTime: (TimeOfDay time) {
                      setState(() {
                        _toTime = time;
                      });
                    },
                  ),
                ),
                const SizedBox(
                    width: 16.0
                ),
              ],
            ),
//active or  not
            new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new Text('Keep me Active',
                        style: Theme.of(context).textTheme.body2),
                  ),
                ),
                new Switch(
                    value: switchValue,
                    onChanged: (bool value) {
                      setState(() {
                        switchValue = value;
                      });
                    }
                ),
              ],
            ),
            new Container(
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: new RaisedButton(
                child: const Text('SUBMIT'),
                onPressed: _handleSubmitted,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted() {

  }
}

class _DateTimePicker extends StatelessWidget {
  const _DateTimePicker({
    Key key,
    this.labelText,
    this.selectedDate,
    this.selectedTime,
    this.selectDate,
    this.selectTime
  }) : super(key: key);

  final String labelText;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final ValueChanged<DateTime> selectDate;
  final ValueChanged<TimeOfDay> selectTime;


  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: selectedTime
    );
    if (picked != null && picked != selectedTime)
      selectTime(picked);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final TextStyle valueStyle = Theme.of(context).textTheme.title;
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[new Expanded(
        flex: 4,
        child: new _InputDropdown(
          labelText: labelText,
          valueText: selectedTime.format(context),
          valueStyle: valueStyle,
          onPressed: () {
            _selectTime(context);
          },
        ),
      ),
      ],
    );
  }
}

class _InputDropdown extends StatelessWidget {
  const _InputDropdown({
    Key key,
    this.child,
    this.labelText,
    this.valueText,
    this.valueStyle,
    this.onPressed }) : super(key: key);

  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new InkWell(
      onTap: onPressed,
      child: new InputDecorator(
        decoration: new InputDecoration(
          labelText: labelText,
        ),
        baseStyle: valueStyle,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text(valueText, style: valueStyle),
            new Icon(Icons.arrow_drop_down,
                color: Theme.of(context).brightness == Brightness.light ? Colors.grey.shade700 : Colors.white70
            ),
          ],
        ),
      ),
    );
  }
}