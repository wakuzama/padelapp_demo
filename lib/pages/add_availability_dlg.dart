import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:padelapp_demo/model/availability_entry.dart';
import 'package:padelapp_demo/model/days_available.dart';

class AddAvailabilityDlg extends StatefulWidget{
//  static const String routeName = '/components/date-and-time-pickers';

  List<DateList> dateList; // =  dateList('Monday','assets/person.png',false),;
//  final DateList datelist;
  final String initialAvailability;
  final AvailabilityEntry availabilityEntryEdit;
  AddAvailabilityDlg.add(this.initialAvailability) : availabilityEntryEdit = null;

  AddAvailabilityDlg.edit(this.availabilityEntryEdit)
      : initialAvailability = availabilityEntryEdit.avaDays;

  @override
  _AddAvailabilityDlgState createState() {
    if (availabilityEntryEdit != null) {
      return new _AddAvailabilityDlgState(availabilityEntryEdit.avaPlace, availabilityEntryEdit.avaKm, availabilityEntryEdit.avaDays, availabilityEntryEdit.avaStartTime,
          availabilityEntryEdit.avaEndTime, availabilityEntryEdit.avaActive);
    } else {
      return new _AddAvailabilityDlgState(
          'Home', '5', 'Monday',new TimeOfDay.now(),new TimeOfDay.now(), 'Active');
    }
  }
}
//
//  @override
//  _AddAddressDlgState createState() => new _AddAddressDlgState('','','','','','',false);




class _AddAvailabilityDlgState extends State<AddAvailabilityDlg>{
  TimeOfDay _avaStartTime = new TimeOfDay.now();
  TimeOfDay _avaEndTime = new TimeOfDay.now();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


//  double _weight = 00.00;
//  TextEditingController _textController;
//  TextEditingController _textControllerAddress;
//  TextEditingController _textControllerCity;
//  TextEditingController _textControllerPostcode;
//  String _note;
//  String addPlaceDrop = 'Home';
//  String addKmDrop = '5';
//  String addDaysDrop = 'Saturday';
//  String addDivisionDrop = 'Div 1';
  String _avaPlace;
  String _avaKm;
  String _avaDays;
  String _date;
  List<Checkbox>_dates = new List<Checkbox>();

//  DateTime _avaStartTime;
//  DateTime _avaEndTime;
  String _avaActive;

  bool switchValue = false;

//  String mndy;
//  String tudy = ' ';
//  String wddy = ' ';
//  String thdy = ' ';
//  String frdy = ' ';
//  String stdy = ' ';
//  String sndy = ' ';
//  String evdy = ' ';
//  String wkdy = ' ';
//  String wedy = ' ';


  bool checkboxValueMonday = false;
  bool checkboxValueTuesday = false;
  bool checkboxValueWednsday = false;
  bool checkboxValueThursday = false;
  bool checkboxValueFriday = false;
  bool checkboxValueSaturday = false;
  bool checkboxValueSunday = false;
  bool checkboxValueEveryDay= false;
  bool checkboxValueEveryWeekEnd = false;
  bool checkboxValueEveryWeekDay = false;

  int checkBoxSelected;

//  setDates(){
//    if(checkboxValueMonday == true){
//      mndy = 'Monday';
////      return mndy;
//    }
//  }

  void handleDaysRadioValueChanged(int value) {
    setState(() {
//      var value;
      switch (checkBoxSelected) {
//        case 0:
//        _avaDays = 'Everyday';// do something
//          break;
        case 1:
          _avaDays = 'Monday';// do something else
          break;
        case 2:
          _avaDays = 'Tueusday';// do something else All
          break;
        case 3:
          _avaDays = 'Wednsday';// do something else
          break;
        case 4:
          _avaDays = 'Thursday';// do something else
          break;
        case 5:
          _avaDays = 'Friday';// do something else
          break;
        case 6:
          _avaDays = 'Saturday';// do something else
          break;
        case 7:
          _avaDays = 'Sunday';// do something else
          break;
        case 8:
          _avaDays = 'Everyday';// do something else
          break;
        case 9:
          _avaDays = 'Every_Weekday';// do something else
        break;
        case 10:
          _avaDays = 'Every_Weekend';// do something else
        break;
      }
    });
  }
//  bool checkboxValueMonday = false;

  _AddAvailabilityDlgState(this._avaPlace, this._avaKm, this._avaDays, this._avaStartTime, this._avaEndTime, this._avaActive);

//  @overrideride
//  void initState() {
////    _textController = new TextEditingController(text: _note);
////    _textControllerAddress = new TextEditingController(text: _address);
////    _textControllerCity = new TextEditingController(text: _addCity);
////    _textControllerPostcode = new TextEditingController(text: _addPostcode);
////    _textController = new TextEditingController(text: _note);
////    _textController = new TextEditingController(text: _note);
//    super.initState();
//  }

  final List<String> _allPlaceTypes = <String>['address 1', 'address 2','club 1', 'club2', 'all my addresses', 'all my clubs',].toList();
  String avaPlaceDrop;
  final List<String> _allAdddressPlaceTypes = <String>['address 1', 'address 2', 'all my addresses',].toList();
  String avaAddressDrop;
  final List<String> _allClubPlaceTypes = <String>['club 1', 'club2', 'all my clubs',].toList();
  String avaClubDrop;
  final List<String> _allKmTypes = <String>['1','2','3','4','5','6','7','8','9','10','15','20','25',].toList();
  String avaKmDrop;
  final List<String> _allDateTypes = <String>['Everyday', 'Week Ends', 'All Weekdays', 'Monday','Tuesday','WednsDay','Thursday','Friday','Saturday','Sunday',].toList();
  String avaDateDrop;

  int radioValueAddress;
  void handleAddressRadioValueChanged(int value) {
    setState(() {
      radioValueAddress = value;
    });
  }

  getDrop() {
   if(radioValueAddress == 1) {
     return _allAdddressPlaceTypes;
   }else{
     return avaClubDrop;
   }
  }

  @override
  Widget build(BuildContext context) {
//    var _dateTime;
    final avaPlaceDropItems = _allPlaceTypes
        .map((String item) =>
    new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();
//    final avaAddressDropItems = _allAdddressPlaceTypes
//        .map((String item) =>
//    new DropdownMenuItem<String>(value: item, child: new Text(item)))
//        .toList();
//    final avaClubDropItems = _allClubPlaceTypes
//        .map((String item) =>
//    new DropdownMenuItem<String>(value: item, child: new Text(item)))
//        .toList();
    final avaKmDropItems = _allKmTypes
        .map((String item) =>
    new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();
//    final avaDateDropItems = _allDateTypes
//        .map((String item) =>
//    new DropdownMenuItem<String>(value: item, child: new Text(item)))
//        .toList();
//    int  radioValueDays = 0;
    return new Scaffold(
        key: _scaffoldKey,
      appBar: new AppBar(
        title: widget.availabilityEntryEdit == null
            ? const Text("New entry")
            : const Text("Edit entry"),
        actions: [
          new FlatButton(
              onPressed: () {
                //TODO: Handle save
//                for(Checkbox; _date != null; _dates){
//                    if(_date.isChecked()){
//                      String date = _date.getText().toString();
//                    }
//                }
                for (DateList d in widget.dateList){
                  if(d.isCheck){
                    _avaDays = d.dateName;
                  }
                }
                Navigator
                    .of(context)
                    .pop(new AvailabilityEntry(_avaPlace, _avaKm, _avaDays, _avaStartTime, _avaEndTime, _avaActive));
              },
              child: new Text('Save',
                  style: Theme
                      .of(context)
                      .textTheme
                      .subhead
                      .copyWith(color: Colors.white))),
          new FlatButton(
              onPressed: () {
                //TODO: Handle save
//                Navigator
//                    .of(context)
//                    .pop(new AddressEntry(addName, addCountry, addDivision, addPostcode, addCity, address, addActive));
              },
              child: new Text('Delete',
                  style: Theme
                      .of(context)
                      .textTheme
                      .subhead
                      .copyWith(color: Colors.white))),
        ],
      ),
      body:
//      new Column(
    new ListView(
    padding: const EdgeInsets.symmetric(horizontal: 6.0),
        children: <Widget>[

//          new Column(
//            children: <Widget>[
//              new RadioListTile(
//                  value: 0,
//                  title: new Text('From Addresses'),
//                  groupValue: radioValueAddress,
//                  onChanged: handleAddressRadioValueChanged),
////
//              new RadioListTile(
//                  value: 1,
//                  title: new Text('From Clubs'),
//                  groupValue: radioValueAddress,
//                  onChanged: handleAddressRadioValueChanged
//              ),],
//          ),
          new ListTile(
            leading: new Icon(Icons.pin_drop),
            title: const Text('Place:'),
            trailing: new DropdownButton<String>(
              value: avaPlaceDrop ,
              items: avaPlaceDropItems,
              hint: new Text('select'),
              onChanged: (String newValue) {
                setState(() {
                  _avaPlace = newValue;
                  if(newValue != null)
                    avaPlaceDrop = newValue;
                });
              },
//              items: <String>['Home', 'Office', 'Travel', 'Other',]
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
            leading: new Icon(Icons.directions),
            title: const Text('Distance :'),
            trailing: new DropdownButton<String>(
              value: avaKmDrop,
                  hint: const Text('Choose'),
              items: avaKmDropItems,
              onChanged: (String newValue) {
                setState(() {
                  _avaKm = newValue;
                  if(newValue != null)
                    avaKmDrop = newValue;
                });
              },
//              items: <String>[
//                '1','2','3','4','5','6','7','8','9','10','15','20','25',
//              ].map((String value) {
//                return new DropdownMenuItem<String>(
//                  value: value,
//                  child: new Text(value),
//                );
//              }).toList(),
            ),
          ),
          new Divider(
            height: 1.0, indent: 1.0, color: Colors.grey,
          ),
          new Container(
            padding: const EdgeInsets.only(top: 10.0),
            child: new Text('Select Date/Dates', style: Theme.of(context).textTheme.subhead),
          ),
          new Container(
            padding: new EdgeInsets.all(8.0),
//              child: new DateItemList(DateList),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
//                new DateItemList(DateList),
//                new Expanded(
//                    child: new ListView(
//                      padding: new EdgeInsets.symmetric(vertical: 8.0),
//                        children: <Widget>[
//                        ]
////                      children: widget.dateList.map((DateList dateList){
////                        return new DateList();
////                      }).toList(),
//                    ),
//                ),
//                )),
              new CheckboxListTile(
//                onTap: null,
                  value: checkboxValueMonday,
                  title: const Text('Monday'),
                  onChanged: (bool value) {
                    setState(() {
                      checkboxValueMonday = value;
                      _date = 'Monday';
                      checkBoxSelected = 1;
//                      mndy = 'Monday';
                    });
                  }),
              new CheckboxListTile(
                  value: checkboxValueTuesday,
                  title: const Text('Tuesday'),
                  onChanged: (bool value) {
                    setState(() {
                      checkboxValueTuesday = value;
                      checkBoxSelected = 2;
                      _date = 'Tuesday';
                    });
                  }),
              new CheckboxListTile(
                  value: checkboxValueWednsday,
                  title: const Text('Wedensday'),
                  onChanged: (bool value) {
                    setState(() {
                      checkboxValueWednsday = value;
                      _date = 'Wednsday';
                      checkBoxSelected = 3;
                    });
                  }),
              new CheckboxListTile(
                  value: checkboxValueThursday,
                  title: const Text('Thursday'),
                  onChanged: (bool value) {
                    setState(() {
                      checkboxValueThursday = value;
                      _date = 'Thursday';
                      checkBoxSelected = 4;
                    });
                  }),
              new CheckboxListTile(
                  value: checkboxValueFriday,
                  title: const Text('Friday'),
                  onChanged: (bool value) {
                    setState(() {
                      checkboxValueFriday = value;
                      _date = 'Friday';
                      checkBoxSelected = 5;
                    });
                  }),
              new CheckboxListTile(
                  value: checkboxValueSaturday,
                  title: const Text('Saturday'),
                  onChanged: (bool value) {
                    setState(() {
                      checkboxValueSaturday = value;
                      _date = 'Saturday';
                      checkBoxSelected = 6;
                    });
                  }),
              new CheckboxListTile(
                  value: checkboxValueSunday,
                  title: const Text('Sunday'),
                  onChanged: (bool value) {
                    setState(() {
                      checkboxValueSunday = value;
                      _date = 'Sunday';
                      checkBoxSelected = 7;
                    });
                  }),
              new CheckboxListTile(
                  value: checkboxValueEveryDay,
                  title: const Text('Every Day'),
                  onChanged: (bool value) {
                    setState(() {
                      checkboxValueEveryDay = value;
                      _date = 'Every_Day';
                      checkBoxSelected = 8;
                    });
                  }),
              new CheckboxListTile(
                  value: checkboxValueEveryWeekDay,
                  title: const Text('Every Week Day'),
                  onChanged: (bool value) {
                    setState(() {
                      checkboxValueEveryWeekDay = value;
                      _date = 'Every_Week_Day';
                      checkBoxSelected = 9;
                    });
                  }),
              new CheckboxListTile(
                  value: checkboxValueEveryWeekEnd,
                  title: const Text('Every Week End'),
                  onChanged: (bool value) {
                    setState(() {
                      checkboxValueEveryWeekEnd = value;
                      _date = 'Every_Week_End';
                      checkBoxSelected = 10;
                    });
                  }),
              ],
            ),
          ),

//          new ListTile(
//            leading: new Icon(Icons.calendar_view_day),
//            title: const Text('Date'),
//            trailing: new DropdownButton<String>(
//              value: avaDateDrop,
//              hint: new Text('date'),
//              items: avaDateDropItems,
//              onChanged: (String newValue) {
//                setState(() {
//                  _avaDays= newValue;
//                  if(newValue != null)
//                    avaDateDrop = newValue;
//                });
//              },
////              items: <String>['Everyday', 'Week Ends', 'All Weekdays', 'Monday','Tuesday','WednsDay','Thursday','Friday','Saturday','Sunday',]
////                  .map((String value) {
////                return new DropdownMenuItem<String>(
////                  value: value,
////                  child: new Text(value),
////                );
////              }).toList(),
//            ),
//          ),
          new Divider(
            height: 1.0, indent: 1.0, color: Colors.grey,
          ),
              new Row(
                children: <Widget>[
                  new Expanded(
                      child: new ListTile(
                        leading: new Text('From :', style: Theme.of(context).textTheme.subhead,), //Icon(Icons.today, color: Colors.grey[500]),
                        title: new _DateTimePicker(
                          selectedTime: _avaStartTime,
                          selectTime: (TimeOfDay time){
                            setState((){
                              _avaStartTime = time;
                            });
                          },
//                      onChanged:
//                      dateTime: _avaStartTime,
//                      onChanged: (dateTime) => setState(() => _avaStartTime = dateTime),
                        ),
                      ),
                  ),
                  const SizedBox(
                      width: 2.0
                  ),
                  new Expanded(
                      child: new ListTile(
                        leading: new Text('To :', style: Theme.of(context).textTheme.subhead),//Icon(Icons.today, color: Colors.grey[500]),
                        title: new _DateTimePicker(
                          selectedTime: _avaEndTime,
                          selectTime: (TimeOfDay time){
                            setState((){
                              _avaEndTime = time;
                            });
                          },
//                      onChanged: null,
//                      dateTime: _avaEndTime,
//                      onChanged: (dateTime) => setState(() => _avaEndTime = dateTime),
                        ),
                      ),
                  ),
                ],
              ),

//              ),

//              new Expanded(
//                  child:

//              ),
//            ],
//          ),
          new Divider(
            height: 1.0, indent: 1.0, color: Colors.grey,
          ),

          new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                child: new Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: new Text('Keep this Time Active ?',
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
                        _avaActive = 'Active';
                      }else{
                        _avaActive = 'De-Active';
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
//      ),
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

//  void handleDaysRadioValueChanged(int value) {
//    setState(() {
//      var value;
//      switch (value) {
//        case 0:
//        _avaDays = 'Everyday';// do something
//          break;
//        case 1:
//          _avaDays = 'Everyday';// do something else
//          break;
//        case 2:
//          _avaDays = 'All Weekdays';// do something else
//          break;
//        case 3:
//          _avaDays = 'Monday';// do something else
//          break;
//        case 4:
//          _avaDays = 'Tueusday';// do something else
//          break;
//        case 5:
//          _avaDays = 'Wednsday';// do something else
//          break;
//        case 6:
//          _avaDays = 'Thursday';// do something else
//          break;
//        case 7:
//          _avaDays = 'Friday';// do something else
//          break;
//        case 8:
//          _avaDays = 'Saturday';// do something else
//          break;
//          case 9:
//        _avaDays = 'Sunday';// do something else
//        break;
//      }
//    });
//  }
  }



////////////////// date and time /////////////////

class _DateTimePicker extends StatelessWidget {
  const _DateTimePicker({
    Key key,
    this.selectedTime,
    this.selectTime
//    TimeOfDay dateTime,
//    @required this.onChanged
  })
//      : assert(onChanged != null),
////        date = dateTime == null
////            ? new DateTime.now()
////            : new DateTime(dateTime.year, dateTime.month, dateTime.day),
//        time = dateTime == null
//            ? new TimeOfDay.now()
//            : new TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        : super(key: key);

  final TimeOfDay selectedTime;
//  final TimeOfDay time;
  final ValueChanged<TimeOfDay> selectTime;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
//        new Expanded(
//          child:
//          new InkWell(
//            onTap: (() => _showDatePicker(context)),
//            child: new Padding(
//                padding: new EdgeInsets.symmetric(vertical: 8.0),
//                child: new Text(new DateFormat('EEEE, MMMM d').format(date))),
//          ),
//        ),
        new InkWell(
          onTap: (() => _showTimePicker(context)),
          child: new Padding(
              padding: new EdgeInsets.symmetric(vertical: 8.0),
              child: new Text('Time?'),
        ),
        ),
      ],
    );
  }

//  Future _showDatePicker(BuildContext context) async {
//    DateTime dateTimePicked = await showDatePicker(
//        context: context,
//        initialDate: date,
//        firstDate: date.subtract(const Duration(days: 20000)),
//        lastDate: new DateTime.now());
//
//    if (dateTimePicked != null) {
//      onChanged(new DateTime(dateTimePicked.year, dateTimePicked.month,
//          dateTimePicked.day, time.hour, time.minute));
//    }
//  }

  Future _showTimePicker(BuildContext context) async {
    final TimeOfDay timeOfDay =
    await showTimePicker(context: context, initialTime: selectedTime
    );

    if (timeOfDay != null && timeOfDay != selectedTime){
//      onChanged(new TimeOfDay(hour: timeOfDay.hour, minute: timeOfDay.minute));
    selectTime(timeOfDay);
      print(timeOfDay);
    }
//    return timeOfDay;
    //onChanged(new TimeOfDay(hour: timeOfDay.hour, minute: timeOfDay.minute)); //date.year, date.month, date.day, //timeOfDay.hour, timeOfDay.minute,
    //date.year, date.month, date.day,
  }


}

/////////////////// list view for dates ///////////////////////////////

//class DateItemList extends StatelessWidget{
//
//  final List<DateList> _dateList;
//  DateItemList(this._dateList);
//
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialList(
//      type: MaterialListType.oneLine,
//      padding
//    );
//    // TODO: implement build
//  }
//
//}
class DateItemList extends StatefulWidget{

  final DateList dateList;
//  DateItemList(this.dateList);

  DateItemList(DateList dateList)
      : dateList = dateList,
        super(key: new ObjectKey(dateList));

  @override
  DateItemListState createState() {
    return new DateItemListState(dateList);
  }
}
class DateItemListState extends State<DateItemList> {

  final DateList dateList;

  DateItemListState(this.dateList);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        onTap:null,
//        leading: new CircleAvatar(
//          backgroundColor: Colors.blue,
//          child: new Image(image: new AssetImage(dateList.avatarImage)),
//        ),
        title: new Row(
          children: <Widget>[
            new Expanded(child: new Text(dateList.dateName)),
            new Checkbox(value: dateList.isCheck, onChanged: (bool value) {
              setState(() {
                dateList.isCheck = value;
              });
            })
          ],
        )
    );
  }
}
//class DatesItemList extends StatefulWidget{
//
//  final Dates dates;
//
//  DatesItemList(Dates dates): dates = dates, super(key: new ObjectKey(dates));
//
//  @override
//  DateItemState createState() {
//    return new DateItemState(dates);
//  }
//}
//
//class DateItemState extends State<DatesItemList>{
//
//  final Dates dates;
//
////  DateItemState(Dates dates);
//  DatesItemList(this.dates);
//
//
//  @override
//  Widget build(BuildContext context) {
//    return new ListTile(
//        onTap:null,
////        leading: new CircleAvatar(
////          backgroundColor: Colors.blue,
////          child: new Image(image: new AssetImage(dates.avatarImage)),
////        ),
//        title: new Row(
//          children: <Widget>[
//            new Expanded(child: new Text(dates.day)),
//            new Checkbox(value: dates.isCheck, onChanged: (bool value) {
//              setState(() {
//                dates.isCheck = value;
//              });
//            })
//          ],
//        )
//    );
//  }
//}