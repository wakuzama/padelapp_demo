//
//import 'dart:async';
//import 'package:flutter/services.dart';
//import 'package:flutter/material.dart';
//import 'package:padelapp_demo/model/register_entry.dart';
//
//
//class RegisterDlg extends StatefulWidget{
////  final String initialAddress;
////  final PersonData personData;
//
////  RegisterDlg(this.personData);
////  AddAddressDlg.add(this.initialAddress) : addressEntryEdit = null;
//
////  AddAddressDlg.edit(this.addressEntryEdit)
////      : initialAddress  = addressEntryEdit.address;
//  final String initialAddress;
//  final PersonData personData;
//  RegisterDlg.add(this.initialAddress) : personData = null;
//
//  RegisterDlg.edit(this.personData)
//      : initialAddress  = personData.name;
//
//
//  @override
//  _RegisterDlgState createState() {
//    if (personData != null) {
//      return new _RegisterDlgState(personData.name, personData.sirName, personData.email, personData.password, personData.phoneNumber,
//          personData.address, personData.country, personData.division, personData.gender, personData.birthday, personData.postalCode, personData.nic);
//    } else {
//      return new _RegisterDlgState(
//          'name', 'sir', 'email', 'pass', 'phone', 'address', 'UK','Div 1','other','bday','12345','nic009');
//    }
//  }
//}
////
////  @override
////  _AddAddressDlgState createState() => new _AddAddressDlgState('','','','','','',false);
//
//
//class _RegisterDlgState extends State<RegisterDlg>{
////  DateTime _dateTime = new DateTime.now();
////  double _weight = 00.00;
////  TextEditingController _textController;
//  TextEditingController _controllerSirName;
//  TextEditingController _controllerName;
//  TextEditingController _controllerNumber;
//  TextEditingController _controllerEmail;
//  TextEditingController _controllerBdate;// = new TextEditingController();
//  TextEditingController _controllerNicNumber;// = new TextEditingController();
//  TextEditingController _controllerPass;// = new TextEditingController();
////  final TextEditingController _controllerConPass = new TextEditingController();
//  TextEditingController _controllerAddress;// = new TextEditingController();
//  TextEditingController _controllerPostalCode;
//
//  String addGenderDrop = 'Other';
//  String addCountryDrop = 'UK';
//  String addDivisionDrop = 'Div 1';
//
//  String _uid;
//  String _name;
//  String _sirName;
//  String _number;
//  String _email;
//  String _birthdate;
//  String _password;
//  String _gender;
//  String _country;
//  String _division;
//  String _address;
//  String _postalcode;
//  String _nic;
//
//  bool agreed = true;
//  bool switchValue = false;
//
//  _RegisterDlgState(this._uid ,this._name, this._sirName, this._number, this._email, this._birthdate, this._password, this._gender, this._country, this._division, this._address, this._postalcode, this._nic);
//
//  @override
//  void initState() {
//    _controllerEmail = new TextEditingController(text: _email);
//    _controllerSirName = new TextEditingController(text: _sirName);
//    _controllerName = new TextEditingController(text: _name);
//    _controllerNumber = new TextEditingController(text: _number);
//    _controllerBdate = new TextEditingController(text: _birthdate);
//    _controllerNicNumber = new TextEditingController(text: _nic);
//    _controllerPass = new TextEditingController(text: _password);
//    _controllerAddress = new TextEditingController(text: _address);
//    _controllerPostalCode = new TextEditingController(text: _postalcode);
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
////    var _dateTime;
//
//    return new Scaffold(
//      appBar: new AppBar(
//        title: widget.personData == null
//            ? const Text("New entry")
//            : const Text("Edit entry"),
//        actions: [
//          new FlatButton(
//              onPressed: () {
//                //TODO: Handle save
//                Navigator
//                    .of(context)
//                    .pop(new PersonData(_uid, _name, _sirName, _number, _email, _password, _birthdate, _gender, _country, _division, _postalcode, _address, _nic));
//              },
//              child: new Text('Save',
//                  style: Theme
//                      .of(context)
//                      .textTheme
//                      .subhead
//                      .copyWith(color: Colors.white))),
////          new FlatButton(
////              onPressed: () {
////                //TODO: Handle save
//////                Navigator
//////                    .of(context)
//////                    .pop(new AddressEntry(addName, addCountry, addDivision, addPostcode, addCity, address, addActive));
////              },
////              child: new Text('Delete',
////                  style: Theme
////                      .of(context)
////                      .textTheme
////                      .subhead
////                      .copyWith(color: Colors.white))),
//        ],
//      ),
//      body: new Column(
//        children: <Widget>[
//          new ListTile(
////            leading: new Icon(Icons.speaker_notes, color: Colors.grey[500]),
//            title: new TextField(
//              keyboardType: TextInputType.text,
//              decoration: new InputDecoration(
//                hintText: 'Name *',
//              ),
//              controller: _controllerName,
//              onChanged: (value) => _name = value,
//            ),
//          ),
//          new ListTile(
////            leading: new Icon(Icons.speaker_notes, color: Colors.grey[500]),
//            title: new TextField(
//              keyboardType: TextInputType.text,
//              decoration: new InputDecoration(
//                hintText: 'Sir Name *',
//              ),
//              controller: _controllerSirName,
//              onChanged: (value) => _sirName = value,
//            ),
//          ),
//          new ListTile(
////            leading: new Icon(Icons.speaker_notes, color: Colors.grey[500]),
//            title: new TextField(
//              keyboardType: TextInputType.emailAddress,
//              decoration: new InputDecoration(
//                hintText: 'E-mail *',
//              ),
////              validator: (value) =>
////              !value.contains('@') ? 'Not a valid email.' : null,
//              controller: _controllerEmail,
//              onChanged: (value) => _email = value,
//            ),
//          ),
//          new ListTile(
////            leading: new Icon(Icons.speaker_notes, color: Colors.grey[500]),
//            title: new TextField(
//            obscureText: true,
//              decoration: new InputDecoration(
//                hintText: 'Password',
//              ),
//              controller: _controllerPass,
//              onChanged: (value) => _password = value,
//            ),
//          ),
//          new ListTile(
//            leading: new Icon(Icons.pin_drop),
//            title: const Text('Gender :'),
//            trailing: new DropdownButton<String>(
//              value: addGenderDrop,
//              onChanged: (String newValue) {
//                setState(() {
//                  _gender = newValue;
//                });
//              },
//              items: <String>['Male', 'Female', 'Other']
//                  .map((String value) {
//                return new DropdownMenuItem<String>(
//                  value: value,
//                  child: new Text(value),
//                );
//              }).toList(),
//            ),
//          ),
//          new ListTile(
////            leading: new Icon(Icons.speaker_notes, color: Colors.grey[500]),
//            title: new TextField(
//            keyboardType: TextInputType.phone,
//              decoration: new InputDecoration(
//                hintText: 'Phone ',
//              ),
////              validator: _validatePhoneNumber,
//              controller: _controllerNumber,
//              onChanged: (value) => _number = value,
//            ),
//          ),
////              const SizedBox(
////                height: 12.0,
////              ),
//          new ListTile(
//            leading: new Icon(Icons.flag),
//            title: const Text('Country:'),
//            trailing: new DropdownButton<String>(
//              value: addCountryDrop,
////                  hint: const Text('Choose'),
//              onChanged: (String newValue) {
//                setState(() {
//                  _country = newValue;
//                });
//              },
//              items: <String>[
//                'Spain',
//                'France',
//                'England',
//                'Germany',
//                'England',
//                'UK',
//                'Sweden',
//              ].map((String value) {
//                return new DropdownMenuItem<String>(
//                  value: value,
//                  child: new Text(value),
//                );
//              }).toList(),
//            ),
//          ),
//          new ListTile(
////            leading: new Icon(Icons.speaker_notes, color: Colors.grey[500]),
//            title: new TextField(
//            keyboardType: TextInputType.text,
//              decoration: new InputDecoration(
//                hintText: 'Address:',
//              ),
//              controller: _controllerAddress,
//              onChanged: (value) => _address = value,
//            ),
//          ),
////              const SizedBox(
////                height: 12.0,
////              ),
//          new ListTile(
//            leading: new Icon(Icons.flag),
//            title: const Text('Division:'),
//            trailing: new DropdownButton<String>(
//              value: addDivisionDrop,
////                  hint: const Text('Choose'),
//              onChanged: (String newValue) {
//                setState(() {
//                  _division = newValue;
//                });
//              },
//              items: <String>[
//                'Div 1',
//                'Div 2',
//                'Div 3',
//                'Div 4',
//                'Div 5',
//                'Div 6',
//                'Div 7',
//              ].map((String value) {
//                return new DropdownMenuItem<String>(
//                  value: value,
//                  child: new Text(value),
//                );
//              }).toList(),
//            ),
//          ),
//          new ListTile(
////            leading: new Icon(Icons.speaker_notes, color: Colors.grey[500]),
//            title: new TextField(
//            keyboardType: TextInputType.number,
//              decoration: new InputDecoration(
//                hintText: 'Postal Code *',
//              ),
//              controller: _controllerPostalCode,
//              onChanged: (value) => _postalcode = value,
//            ),
//          ),
//          new ListTile(
////            leading: new Icon(Icons.speaker_notes, color: Colors.grey[500]),
//            title: new TextField(
//            keyboardType: TextInputType.datetime,
//              decoration: new InputDecoration(
//                hintText: 'BirthDate',
//              ),
//              controller: _controllerBdate,
//              onChanged: (value) => _birthdate = value,
//            ),
//          ),
//          new ListTile(
////            leading: new Icon(Icons.speaker_notes, color: Colors.grey[500]),
//            title: new TextField(
//            keyboardType: TextInputType.number,
//              decoration: new InputDecoration(
//                hintText: 'NIC : ',
//              ),
////              validator: _validateNICValue,
//              controller: _controllerNicNumber,
//              onChanged: (value) => _nic = value,
//            ),
//          ),
//          const Divider(
//            height: 1.0,
//          ),
//          new Card(
//            elevation: 3.00,
//            child: new Column(
//              children: <Widget>[
//                new CheckboxListTile(
//                    value: agreed,
//                    title:
//                    const Text('Agreed to the Terms and Conditions.'),
//                    onChanged: (bool value) {
//                      setState(() {
//                        agreed = value;
//                      });
//                    }),
//                new ButtonTheme.bar(
//                  // make buttons use the appropriate styles for cards
//                  child: new ButtonBar(
//                    children: <Widget>[
//                      new FlatButton(
//                        child: const Text('Read Terms'),
//                        onPressed: () {
//                          /* ... */
//                        },
//                      ),
//                    ],
//                  ),
//                ),
//              ],
//            ),
//          ),
//          new Container(
//            padding: const EdgeInsets.all(20.0),
//            alignment: Alignment.center,
//            child: new RaisedButton(
//              child: const Text('SUBMIT'),
//              onPressed: _handleSubmitted,
//            ),
//          ),
//          new Container(
//            padding: const EdgeInsets.only(top: 20.0),
//            child: new Text('* indicates required field',
//                style: Theme.of(context).textTheme.caption),
//          ),
//        ],
//      ),
//      //new Text("Foo"),
//    );
//  }
////          new Row(
////            crossAxisAlignment: CrossAxisAlignment.start,
////            children: <Widget>[
////              new Expanded(
////                child: new Container(
////                  padding: const EdgeInsets.only(top: 20.0),
////                  child: new Text('Keep this Address Active',
////                      style: Theme.of(context).textTheme.body2),
////                ),
////              ),
////              //const SizedBox(width: 16.0),
//////                  new Expanded(
////              new Switch(
////                  value: switchValue,
////                  onChanged: (bool value) {
////                    setState(() {
////                      if(value == true){
////                        _addActive = 'Active';
////                      }else{
////                        _addActive = 'De-Active';
////                      }
//////                      _addActive = value;
////                    });
////                  }
////              ),
//////                  ),
////            ],
////          ),
////          new ListTile(
////            leading: new Icon(Icons.today, color: Colors.grey[500]),
////            title: new DateTimeItem(
////              dateTime: _dateTime,
////              onChanged: (dateTime) => setState(() => _dateTime = dateTime),
////            ),
////          ),
////          new ListTile(
//////            leading: new Image.asset(
//////              "assets/scale-bathroom.png",
//////              color: Colors.grey[500],
//////              height: 24.0,
//////              width: 24.0,
//////            ),
////            title: new Text(
////              "$_weight kg",
////            ),
////            onTap: () => _showWeightPicker(context),
////          ),
////          new ListTile(
////            leading: new Icon(Icons.speaker_notes, color: Colors.grey[500]),
////            title: new TextField(
////              decoration: new InputDecoration(
////                hintText: 'Optional note',
////              ),
////              controller: _textController,
////              onChanged: (value) => _note = value,
////            ),
////          ),
//
//
////  _showWeightPicker(BuildContext context) {
////    showDialog(
////      context: context,
////      child: new NumberPickerDialog.decimal(
////        minValue: 1,
////        maxValue: 150,
////        initialDoubleValue: _weight,
////        title: new Text("Enter your weight"),
////      ),
////    ).then((value) {
////      if (value != null) {
////        setState(() => _weight = value);
////      }
////    });
////  }
//  bool _autovalidate = false;
//  bool _formWasEdited = false;
//  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
//
//  String _validatePhoneNumber(String value) {
//    _formWasEdited = true;
//    final RegExp phoneExp = new RegExp(r'^\(\d\d\d\) \d\d\d-\d\d\d\d$');
//    if (!phoneExp.hasMatch(value))
//      return '(###) ###-#### - Please enter a valid phone number.';
//    return null;
//  }
//
//  String _validatePassword(String value) {
//    _formWasEdited = true;
//
//    final GlobalKey<FormFieldState<String>> _passwordFieldKey =
//    new GlobalKey<FormFieldState<String>>();
//
//    final FormFieldState<String> passwordField = _passwordFieldKey.currentState;
//    if (passwordField.value == null || passwordField.value.isEmpty)
//      return 'Please choose a password.';
//    if (passwordField.value != value) return 'Passwords don\'t match';
//    return null;
//  }
//  String _validateNICValue(String value) {
//    _formWasEdited = true;
//    if (value == null) return 'NIC value required';
//    final RegExp nicExp = new RegExp(r'^[A-Za-z 0-9]+$');
//    if (!nicExp.hasMatch(value)) return 'Please enter a valid number';
//    return null;
//  }
//
//  Future<bool> _warnUserAboutInvalidData() async {
//    final FormState form = _formKey.currentState;
//    if (form == null || !_formWasEdited || form.validate()) return true;
//
//    return await showDialog<bool>(
//      context: context,
//      child: new AlertDialog(
//        title: const Text('This form has errors'),
//        content: const Text('Really leave this form?'),
//        actions: <Widget>[
//          new FlatButton(
//            child: const Text('YES'),
//            onPressed: () {
//              Navigator.of(context).pop(true);
//            },
//          ),
//          new FlatButton(
//            child: const Text('NO'),
//            onPressed: () {
//              Navigator.of(context).pop(false);
//            },
//          ),
//        ],
//      ),
//    ) ??
//        false;
//  }
//
////  void _handleSubmitted() {
////
////  }
//  Future _handleSubmitted() async{
//    final FormState form = _formKey.currentState;
//    if (!form.validate()) {
//      _autovalidate = true; // Start validating on every change.
////      showInSnackBar('Please fix the errors in red before submitting.');
//    } else {
//      form.save();
//      // TODO save data
////      new PersonData(_name, _sirName, _number, _email, _password, _birthdate, _gender, _country, _division, _postalcode, _address, _nic);
//      Navigator.of(context).pushNamedAndRemoveUntil('/MyHomePage', (Route<dynamic> route) => false, );
////            mainReference.push().set(entry.toJson());
////      Navigator.pushNamed(context, MyHomePage.routeName);
//
//    }
//  }
//
////    PersonData save = await
////    Navigator.of(context).push(new MaterialPageRoute<PersonData>(
////        builder: (BuildContext context){
////          return new RegisterDlg(personData).add(
////              dataSaves.isNotEmpty ? dataSaves.last.address: 'address');
////        },
////        fullscreenDialog: true));
////    if (save != null) {
////      mainReference.push().set(save.toJson());
//////    _addAddressSave(save);
////    }
////  }
//}
//
//
//////////////////// date and time /////////////////
//
////class DateTimeItem extends StatelessWidget {
////  DateTimeItem({Key key, DateTime dateTime, @required this.onChanged})
////      : assert(onChanged != null),
////        date = dateTime == null
////            ? new DateTime.now()
////            : new DateTime(dateTime.year, dateTime.month, dateTime.day),
////        time = dateTime == null
////            ? new DateTime.now()
////            : new TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
////        super(key: key);
////
////  final DateTime date;
////  final TimeOfDay time;
////  final ValueChanged<DateTime> onChanged;
////
////  @override
////  Widget build(BuildContext context) {
////    return new Row(
////      children: <Widget>[
////        new Expanded(
////          child: new InkWell(
////            onTap: (() => _showDatePicker(context)),
////            child: new Padding(
////                padding: new EdgeInsets.symmetric(vertical: 8.0),
////                child: new Text(new DateFormat('EEEE, MMMM d').format(date))),
////          ),
////        ),
////        new InkWell(
////          onTap: (() => _showTimePicker(context)),
////          child: new Padding(
////              padding: new EdgeInsets.symmetric(vertical: 8.0),
////              child: new Text('$time')),
////        ),
////      ],
////    );
////  }
////
////  Future _showDatePicker(BuildContext context) async {
////    DateTime dateTimePicked = await showDatePicker(
////        context: context,
////        initialDate: date,
////        firstDate: date.subtract(const Duration(days: 20000)),
////        lastDate: new DateTime.now());
////
////    if (dateTimePicked != null) {
////      onChanged(new DateTime(dateTimePicked.year, dateTimePicked.month,
////          dateTimePicked.day, time.hour, time.minute));
////    }
////  }
////
////  Future _showTimePicker(BuildContext context) async {
////    TimeOfDay timeOfDay =
////    await showTimePicker(context: context, initialTime: time);
////
////    if (timeOfDay != null) {
////      onChanged(new DateTime(
////          date.year, date.month, date.day, timeOfDay.hour, timeOfDay.minute));
////    }
////  }
////}