import 'dart:async';
import 'dart:convert';
import 'package:padelapp_demo/globals/user_globals.dart' as uGlobals;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:padelapp_demo/components/inputField.dart';
import 'package:padelapp_demo/components/rounded_button.dart';
import 'package:padelapp_demo/model/register_entry.dart';
import 'package:padelapp_demo/services/authentication.dart';
import 'package:padelapp_demo/services/validations.dart';
import 'package:padelapp_demo/theme/style.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key, this.title}) : super(key: key);

//  final String initialData;
//  final PersonData personData;

//  RegisterPage.add(this.initialData, this.title) : personData = null;
  final String title;

  static const String routeName = './RegisterPage';

  @override
  RegisterPageState createState() => new RegisterPageState();
//  {
//    if (personData != null) {
//      return new RegisterPageState(
//        personData.uid,
//          personData.name,
//          personData.sirName,
//          personData.email,
//          personData.password,
//          personData.phoneNumber,
//          personData.address,
//          personData.country,
//          personData.division,
//          personData.gender,
//          personData.birthday,
//          personData.postalCode,
//          personData.nic);
//    } else {
//      return new RegisterPageState(
//          '','', '', '', '', '', '', '', '', '', '', '', '');
//    }
//  } //new RegisterPageState("", "", "", "", "", "", "", "", "", "", "", "");
}

//final mainReference = FirebaseDatabase.instance.reference();

class RegisterPageState extends State<RegisterPage> {
//  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//  DateTime _toDate = new DateTime.now();
//  TimeOfDay _toTime = const TimeOfDay(hour: 7, minute: 28);
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  PersonData personData = new PersonData();

  UserAuth userAuth = new UserAuth();
  bool _autoValidate = false;
  Validations validations = new Validations();


  TextEditingController _controllerSirName; // = new TextEditingController();
  TextEditingController _controllerName; // = new TextEditingController();
  TextEditingController _controllerNumber; // = new TextEditingController();
  TextEditingController _controllerEmail; // = new TextEditingController();
  TextEditingController _controllerBdate; // = new TextEditingController();
  TextEditingController _controllerNicNumber; // = new TextEditingController();
  TextEditingController _controllerPass; // = new TextEditingController();
  TextEditingController _controllerConPass = new TextEditingController();
  TextEditingController _controllerAddress; // = new TextEditingController();
  TextEditingController _controllerPostalCode; // = new TextEditingController();

//  String addGenderDrop = 'Other';
//  String addCountryDrop = 'UK';
//  String addDivisionDrop = 'Div 1';
  String _uid;
  String _name;
  String _sirName;
  String _number;
  String _email;
  String _birthdate;
  String _password;
  String _conPass;
  String _gender;
  String _country;
  String _division;
  String _address;
  String _postalcode;
  String _nic;

  bool switchValue = false;

//  RegisterPageState(
//      this._uid,
//      this._name,
//      this._sirName,
//      this._email,
//      this._password,
//      this._number,
//      this._address,
//      this._country,
//      this._division,
//      this._gender,
//      this._birthdate,
//      this._postalcode,
//      this._nic);

//  PersonData person =
//      new PersonData("", "", "", "", "", "", "", "", "", "", "", "");

  @override
  initState() {
    _controllerEmail = new TextEditingController(text: _email);
    _controllerSirName = new TextEditingController(text: _sirName);
    _controllerName = new TextEditingController(text: _name);
    _controllerNumber = new TextEditingController(text: _number);
    _controllerBdate = new TextEditingController(text: _birthdate);
    _controllerNicNumber = new TextEditingController(text: _nic);
    _controllerPass = new TextEditingController(text: _password);
    _controllerConPass = new TextEditingController(text: _conPass);
    _controllerAddress = new TextEditingController(text: _address);
    _controllerPostalCode = new TextEditingController(text: _postalcode);
    super.initState();
  }

  final List<String> _allGenderTypes = <String>[
    'Male',
    'Female',
    'Other',
  ].toList();
  String _genderSelection;
  final List<String> _allCountryTypes = <String>[
    'UK',
    'Spain',
    'France',
    'Italy',
    'USA',
    'China',
  ].toList();
  String _countrySelection;
  final List<String> _allDivisions = <String>[
    'div 1',
    'div 2',
    'div 3',
    'div 4',
    'div 5',
    'div 6',
  ].toList();
  String _divisionSelection;

//  @override
//  void initState() {
//    _genderSelection = _allGenderTypes.first;
//    _countrySelection = _allCountryTypes.first;
//    _divisionSelection = _allDivisions.first;
//    super.initState();
//  }

  _onPressed() {
    print("button clicked");
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }
  bool agreed = false;
//  bool _autovalidate = false;
  bool _formWasEdited = false;
//  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      new GlobalKey<FormFieldState<String>>();
  final _NumberTextInputFormatter _phoneNumberFormatter =
      new _NumberTextInputFormatter();

//  final _UsNumberTextInputFormatter _postalcodeFormatter = new _UsNumberTextInputFormatter();
  void _handleSubmitted() {
    _autoValidate = true;
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
//      _autoValidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      userAuth.createUser(personData).then((onValue) {
        showInSnackBar(onValue);
      }).catchError((PlatformException onError) {
        showInSnackBar(onError.message);
      });
      _savePersonData(personData);
//      _saveUserData();
      Navigator.of(context).pushNamedAndRemoveUntil('/MyHomePage',(Route<dynamic> route) => false,
          );
    }
  }
//  void _handleSubmitted() {
//    final FormState form = _formKey.currentState;
//    if (!form.validate()) {
////      _autovalidate = true; // Start validating on every change.
//      showInSnackBar('Please fix the errors in red before submitting.');
//    } else {
//      form.save();
////      showInSnackBar('${person.name}\'s phone number is ${person.phoneNumber}');
////      _controller.text  = value;
////      PersonData.instance.sirName = sirname;
////        person.sirName = _controllerSirName.text;
////        person.name = _controllerName.text;
////      person.email = _controllerEmail.text;
////    person.password = _controllerPass.text;
////    person.phoneNumber = _controllerNumber.text;
////    person.birthday = _controllerBdate.text;
//////    person.gende
//////    person.country,
//////    person.division,
////    person.address = _controllerAddress.text;
////    person.postalCode = _controllerPostalCode.text;
////    person.nic = _controllerNicNumber.text;
//// TODO save data
////      _savePersonData(new PersonData(
////          _uid,
////          _name,
////          _sirName,
////          _number,
////          _email,
////          _password,
////          _birthdate,
////          _gender,
////          _country,
////          _division,
////          _postalcode,
////          _address,
////          _nic));
////      Navigator.of(context).pushNamedAndRemoveUntil(
////            '/MyHomePage',
////            (Route<dynamic> route) => false,
////          );
////            mainReference.push().set(entry.toJson());
////      Navigator.pushNamed(context, MyHomePage.routeName);
//
//    }
//  }

//  String _validateName(String value) {
//    _formWasEdited = true;
//    if (value.isEmpty) return 'Name is required.';
//    final RegExp nameExp = new RegExp(r'^[A-Za-z ]+$');
//    if (!nameExp.hasMatch(value))
//      return 'Please enter only alphabetical characters.';
//    return null;
//  }

//  String _validatePhoneNumber(String value) {
//    _formWasEdited = true;
//    final RegExp phoneExp = new RegExp(r'^\(\d\d\d\) \d\d\d-\d\d\d\d$');
//    if (!phoneExp.hasMatch(value))
//      return '(###) ###-#### - Please enter a valid phone number.';
//    return null;
//  }

//  String _validatePassword(String value) {
//    _formWasEdited = true;
//    final FormFieldState<String> passwordField = _passwordFieldKey.currentState;
//    if (passwordField.value == null || passwordField.value.isEmpty)
//      return 'Please choose a password.';
//    if (passwordField.value != value) return 'Passwords don\'t match';
//    return null;
//  }

//  String _validateBirthday(String value) {
//    _formWasEdited = true;
//    if (value.isEmpty) return 'Birthday is required.';
//    final RegExp bdayExp = new RegExp(r'^[A-Za-z 0-9]+$');
//    if (!bdayExp.hasMatch(value))
//      return 'Please enter only alphabetical characters.';
//    return null;
//  }

//  String _validatePostalcode(String value) {
//    _formWasEdited = true;
//    final RegExp phoneExp =
//        new RegExp(r'^[0-9]+$'); //(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
//    if (!phoneExp.hasMatch(value))
//      return '###-#### - Please enter a valid postal code.';
//    return null;
//  }

//  String _validateNICValue(String value) {
//    _formWasEdited = true;
//    if (value == null) return 'NIC value required';
//    final RegExp nicExp = new RegExp(r'^[A-Za-z 0-9]+$');
//    if (!nicExp.hasMatch(value)) return 'Please enter a valid number';
//    return null;
//  }

  Future<bool> _warnUserAboutInvalidData() async {
    final FormState form = _formKey.currentState;
    if (form == null || !_formWasEdited || form.validate()) return true;

    return await showDialog<bool>(
          context: context,
          child: new AlertDialog(
            title: const Text('This form has errors'),
            content: const Text('Really leave this form?'),
            actions: <Widget>[
              new FlatButton(
                child: const Text('YES'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              new FlatButton(
                child: const Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ],
          ),
        ) ??
        false;
  }

//Future<Null> _saveUserData() async {
//final SharedPreferences prefs = await _prefs;
////    final String u_name = prefs.setString("u_name", _controllerName.text);
//    setState((){
//      prefs.setString("u_name", _controllerName.text );
//      prefs.setString("u_sirname", _sirName);
//      prefs.setString("u_mail", _email);
//      prefs.setString("u_pass", _password);
//      prefs.setString("u_phone", _number);
//      prefs.setString("u_bdate", _birthdate);
//      prefs.setString("u_address", _address);
////      prefs.setString("u_mail", _email);
//    });
//    prefs.setString("u_name", _name);

//    _prefs.setString("u_name", _controllerName.text.toString());
//    _prefs.setString("u_sirname", _controllerSirName.text.toString());
//    _prefs.setString("u_email", _controllerEmail.text.toString());
//    _prefs.setString("u_pass", _controllerPass.text.toString());
//    _prefs.setString("u_phone", _controllerNumber.text.toString());
//    _prefs.setString("u_gender", _genderSelection.toString());
//    _prefs.setString("u_bdate", _controllerBdate.text.toString());
//    _prefs.setString("u_country", _countrySelection.toString());
//    _prefs.setString("u_address", _controllerAddress.text.toString());
//    _prefs.setString("u_division", _divisionSelection.toString());
//    _prefs.setString("u_postcode", _controllerPostalCode.text.toString());
//    _prefs.setString("u_nic", _controllerNicNumber.text.toString());
//  }

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    final dropdownMenuOptionsGender = _allGenderTypes
        .map((String item) =>
            new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();
    final dropdownMenuOptionsCountry = _allCountryTypes
        .map((String item) =>
            new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();
    final dropdownMenuOptionsDivision = _allDivisions
        .map((String item) =>
            new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();


    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: const Text('Sign Up'),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          padding: new EdgeInsets.all(16.0),
//          decoration: new BoxDecoration(image: backgroundImage),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
//              new SizedBox(
//                  height: screenSize.height / 2 + 20,
//                  child: new Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      new Text(
//                        "CREATE ACCOUNT",
//                        textAlign: TextAlign.center,
//                        style: headingStyle,
//                      )
//                    ],
//                  )),
              new Column(
                children: <Widget>[
                  new Form(
                    key: _formKey,
                    autovalidate: _autoValidate,
                    onWillPop: _warnUserAboutInvalidData,
                    child: new Column(
//                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      children: <Widget>[
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Expanded(
                              child: new InputField(
                                controller: _controllerName,
                                initialValue: _controllerName.text,
                                obscureText: false,
//                                textColor: Colors.indigo,
                                textInputType: TextInputType.text,
                                textStyle: new TextStyle(color: Colors.blueGrey), //.withOpacity(0.8)
                                textFieldColor: textFieldColor,
//                                decoration: const InputDecoration(
                                  icon: Icons.person, iconColor: Colors.blueGrey,
                                  bottomMargin: 12.0,
                                  hintText: 'Display Name',
                                  labelText: 'Name *',
//                                ),
                                onSaved: (String value) {
                                  personData.name =  value;
                                  setState(() {
                                    _controllerName.text = value;
                                    _name = _controllerName.text;
                                    uGlobals.u_name = _name;
//                                    _prefs.setString('_name');
                                    if (value != null) _name = value;
                                  });
                                },
                                validateFunction: validations.validateName,
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            new Expanded(
                              child: new InputField(
                                controller: _controllerSirName,
                                initialValue: _controllerSirName.text,
                                obscureText: false,
                                textInputType: TextInputType.text,
                                textStyle: new TextStyle(color: Colors.blueGrey),
                                textFieldColor: textFieldColor,
//                                decoration: new InputDecoration(
                                  icon: Icons.person, iconColor: Colors.blueGrey,
                                  bottomMargin: 12.0,
                                  hintText: 'Surname',
                                  labelText: 'Surname*',
//                                ),
                                onSaved: (String value) {
                                  personData.sirName = value;
                                  setState(() {
                                    _controllerSirName.text = value;
                                    _sirName = _controllerSirName.text;
                                    uGlobals.u_sirname = _sirName;
                                    if (value != null) _sirName = value;
                                  });
                                },
                                validateFunction: validations.validateName,
                              ),
                            ),
//                  child: new TextFormField(
//                    controller: _controller,
//                    decoration: const InputDecoration(
////                  icon: const Icon(Icons.person),
//                      hintText: 'Sir Name',
//                      labelText: 'Sir Name *',
//                    ),
//                    onSaved: (String value) {
//                      _controller.text  = value;
//                      person.sirName = _controller.text;
//                    },
////                validator: _validateName,
                          ],
                        ),
                        new InputField(
                          controller: _controllerNumber,
                          initialValue: _controllerNumber.text,
                          obscureText: false,
                          textInputType: TextInputType.phone,
                          textStyle: new TextStyle(color: Colors.blueGrey),
                          textFieldColor: textFieldColor,
//                          decoration: const InputDecoration(
                              icon: Icons.phone, iconColor: Colors.blueGrey,
                              bottomMargin: 12.0,
                              hintText: 'Where can we reach you?',
                              labelText: 'Phone Number *',
//                          ),
                          // TextInputFormatters are applied in sequence.
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly,
//                            // Fit the validating format.
                            _phoneNumberFormatter,
                          ],
                          onSaved: (String value) {
                            personData.phoneNumber = value;
                            setState(() {
                              _controllerNumber.text = value;
                              _number = _controllerNumber.text;
                              uGlobals.u_phone = _number;
                              if (value != null) _number = value;
                            });
                          },
                          validateFunction: validations.validatePhoneNumber,
                        ),
//              new Container(
//                padding: const EdgeInsets.only(
//                    left: 20.0, right: 20.0, top: 0.0, bottom: 0.0),
////                child: new EnsureVisibleWhenFocused(
////                  focusNode: _focusNode_nooftickets,
//                  child: new TextFormField(
//                    controller: _controllerEmail,
//                    initialValue: _controllerEmail.text,
////                    focusNode: _focusNode_nooftickets,
//                    keyboardType: TextInputType.number,
//                    inputFormatters: <TextInputFormatter>[
//                      WhitelistingTextInputFormatter.digitsOnly
//                    ],
////                    validator: validatenooftickets,
//                    onSaved: (String value) {
//                      setState((){
//                        _controllerEmail.text = value;
//                        _email = _controllerEmail.text;
////                        if(value != null)
////                          _email = value;
//                      });
////                      ticketmode.nooftickets = value;
//                    },
//                  ),
////                ),
//              ),
//////
                        ////

                        new InputField(
                          controller: _controllerEmail,
                          initialValue: _controllerEmail.text,
                          obscureText: false,
                          textInputType: TextInputType.emailAddress,
                          textStyle: new TextStyle(color: Colors.blueGrey),
                          textFieldColor: textFieldColor,
//                          decoration: const InputDecoration(
                            icon: Icons.email, iconColor: Colors.blueGrey,
                            bottomMargin: 12.00,
                            hintText: 'Your email address',
                            labelText: 'E-mail',
//                          ),
//                          maxLines: 1,
                          onSaved: (String value) {
                            personData.email = value;
                            setState(() {
                              _controllerEmail.text = value;
                              _email = _controllerEmail.text;
                              uGlobals.u_mail = _email;
                              if (value != null) _email = value;
                            });
                          },
                          validateFunction: validations.validateEmail,
//                validator: (value) =>
//                    !value.contains('@') ? 'Not a valid email.' : null,
                        ),
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Expanded(
                              child: new InputField(
                                controller: _controllerPass,
                                initialValue: _controllerPass.text,
//                                key: _passwordFieldKey,
                                textInputType: TextInputType.text,
                                textStyle: new TextStyle(color: Colors.blueGrey),
                                textFieldColor: textFieldColor,
//                                decoration: const InputDecoration(
                                  hintText: 'Your log in?',
                                  labelText: 'Password *',
                                  bottomMargin: 12.00,
//                                ),
                                obscureText: true,
                                onSaved: (String value) {
                                  personData.password = value;
                                  setState(() {
                                    _controllerPass.text = value;
                                    _password = _controllerPass.text;
                                    uGlobals.u_pass = _password;
                                    if (value != null) _password = value;
                                  });
                                },
                                validateFunction: validations.validatePassword,
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            new Expanded(
                              child: new InputField(
                                controller: _controllerConPass,
                                initialValue: _controllerConPass.text,
                                textInputType: TextInputType.text,
                                textStyle: new TextStyle(color: Colors.blueGrey),
                                textFieldColor: textFieldColor,
//                                decoration: const InputDecoration(
                                  hintText: '',
                                  labelText: 'Re-type *',
                                  bottomMargin: 12.00,
//                                ),
                                obscureText: true,
//                      onFieldSubmitted: (String value) { _handleSubmitted(); },

                                onSaved: (String value) {
                                  setState(() {
                                    _controllerConPass.text = value;
                                    _conPass = _controllerConPass.text;
                                    if (value != null) _conPass = value;
                                  });
                                },
                                validateFunction: (validations) => _password != _conPass ? 'Passwords does not match': null,
//                                validateFunction: validations.validatePassword,
                              ),
                            ),
                          ],
                        ),
//                new ListTile(
//                title: const Text('Gender'),
//                  trailing: new DropdownButton<String>(
//                value: person.gender,//genderValue,
//                onChanged: (String newValue) {
//                  setState(() {
////                    genderValue = newValue;
//                  if(newValue != null)
//                    person.gender = newValue;
//                  });
//                },
//                items: <String>['Male', 'Female', 'Other'].map((String value) {
//                  return new DropdownMenuItem<String>(
//                    value: value,
//                    child: new Text(value));
//                }).toList())
//                ),
//              new Row(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  new Expanded(
                        new ListTile(
                          title: const Text('Gender'),
                          trailing: new DropdownButton<String>(
                              value: _genderSelection,
                              items: dropdownMenuOptionsGender,
                              onChanged: (s) {
                                personData.gender = s;
                                setState(() {
                                  _gender = s;
                                  uGlobals.u_gender = _gender;
                                  if (s != null) _genderSelection = s;
//                              _gender = _genderSelection;
                                });
                              }),
                        ),
//                  ),
//                  new Expanded(
                        new InputField(
                          controller: _controllerBdate,
                          initialValue: _controllerBdate.text,
                          obscureText: false,
                          textInputType: TextInputType.phone,
                          textStyle: new TextStyle(color: Colors.blueGrey),
                          textFieldColor: textFieldColor,
//                          decoration: const InputDecoration(
//                            icon: Icons.person_pin, iconColor: Colors.blueGrey,
                            hintText: 'DD/MM/YYYY',
                            labelText: 'Birthdate:',
                            bottomMargin: 12.00,
//                          ),
                          onSaved: (String value) {
                            personData.birthday = value;
                            setState(() {
                              _controllerBdate.text = value;
                              _birthdate = _controllerBdate.text;
                              uGlobals.u_bdate = _birthdate;
                              if (value != null) _birthdate = value;
                            });
                          },
                          validateFunction: validations.validateBirthday,
//                      validator: _validateBirthday,
                        ),
//                  ),
//                ],
//              ),
                        new ListTile(
                          title: const Text('Country'),
                          trailing: new DropdownButton<String>(
                              value: _countrySelection,
                              items: dropdownMenuOptionsCountry,
                              onChanged: (s) {
                                personData.country = s;
                                setState(() {
                                  _country = s;
                                  uGlobals.u_country = _country;
                                  if (s != null) _countrySelection = s;
//                        person.country = _countrySelection;
                                });
                              }),
                        ),
//              trailing: new DropdownButton<String>(
//                value: person.gender,//genderValue,
//                onChanged: (String newValue) {
//                  setState(() {
////                    genderValue = newValue;
//                  if(newValue != null)
//                    person.gender = newValue;
//                  });
//                },
//                items: <String>['Male', 'Female', 'Other'].map((String value) {
//                  return new DropdownMenuItem<String>(
//                    value: value,
//                    child: new Text(value));
//                }).toList())

//              new ListTile(
//                title: const Text('Country'),
//                trailing: new DropdownButton<String>(
//                  value: person.country,
//                  onChanged: (String newValue) {
//                    setState(() {
//                      person.country = newValue;
//                    });
//                  },
//                  items: <String>['UK','Spain','France','Italy','USA','China'].map((String value) {
//                    return new DropdownMenuItem<String>(
//                      value: value,
//                      child: new Text(value),
//                    );
//                  }).toList(),
//                ),
//              ),
//              new ListTile(
//                title: const Text('Division'),
//                trailing: new DropdownButton<String>(
//                  value: person.division,
//                  onChanged: (String newValue) {
//                    setState(() {
//                      person.division = newValue;
//                    });
//                  },
//                  items: <String>['div 1','div 2','div 3','div 4','div 5','div 6'].map((String value) {
//                    return new DropdownMenuItem<String>(
//                      value: value,
//                      child: new Text(value),
//                    );
//                  }).toList(),
////                  value: person.division,
////                  isDense: true,
//                ),
//              ),
                        new InputField(
                          controller: _controllerAddress,
                          initialValue: _controllerAddress.text,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          textStyle: new TextStyle(color: Colors.blueGrey),
                          textFieldColor: textFieldColor,
//                          decoration: const InputDecoration(
                            hintText: 'Address',
//                  helperText: 'Keep it short, this is just a demo',
                            labelText: 'street address',
                            bottomMargin: 12.00,
//                          ),
//                          maxLines: 1,
                          onSaved: (String value) {
                            personData.address = value;
                            setState(() {
                              _controllerAddress.text = value;
                              _address = _controllerAddress.text;
                              uGlobals.u_address = _address;
                              if (value != null) _address = value;
                            });
                          },
                        ),
                        new ListTile(
                          title: const Text('Divisions'),
                          trailing: new DropdownButton<String>(
                              value: _divisionSelection,
                              items: dropdownMenuOptionsDivision,
                              onChanged: (s) {
                                personData.division = s;
                                setState(() {
                                  _division = s;
                                  uGlobals.u_division = _division;
                                  if (s != null) _divisionSelection = s;
//                        person.division = _divisionSelection;
                                });
                              }),
                        ),
//                        new Row(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: <Widget>[
//                        new Expanded(
//                          child:
                          new InputField(
                            controller: _controllerPostalCode,
                            initialValue: _controllerPostalCode.text,
                            obscureText: false,
                            textInputType: TextInputType.number,
                            textStyle: new TextStyle(color: Colors.blueGrey),
                            textFieldColor: textFieldColor,
//                          decoration: const InputDecoration(
//                            icon: Icons.person_pin, iconColor: Colors.blueGrey,
                            labelText: 'Postal Code', hintText: 'postal code',
                            bottomMargin: 12.00,
//                    prefixText: '\$',
//                    suffixText: 'USD',
//                    suffixStyle: const TextStyle(color: Colors.green)
//                          ),
//                          maxLines: 1,
                            onSaved: (String value) {
                              personData.postalCode = value;
                              setState(() {
                                _controllerPostalCode.text = value;
                                _postalcode = _controllerPostalCode.text;
                                uGlobals.u_postcode = _postalcode;
                                if (value != null) _postalcode = value;
//                    person.postalCode = _controllerPostalCode.text;
//                    if(value != null)
//                      person.postalCode = value;
                              });
                            },
                            validateFunction: validations.validatePostalcode,
//                },validator: _validatePostalcode,
                          ),
//                        ),
//                        const SizedBox(width: 16.0),
//                            new Expanded(
//                                child: new InputField(
//                                  controller: _controllerNicNumber,
//                                  initialValue: _controllerNicNumber.text,
//                                  obscureText: false,
////                                  textColor: Colors.indigo,
//                                  textInputType: TextInputType.number,
//                                  textStyle: new TextStyle(color: Colors.blueGrey),
//                                  textFieldColor: textFieldColor,
////                          decoration: const InputDecoration(
////                  icon: const Icon(Icons.person_pin),
//                                  hintText: 'ID number',
//                                  labelText: 'NIC Number:*',
//                                  bottomMargin: 12.00,
////                          ),
////                                  maxLines: 1,
//                                  onSaved: (String value) {
//                                    personData.nic = value;
//                                    setState(() {
//                                      _controllerNicNumber.text = value;
//                                      _nic = _controllerNicNumber.text;
//                                      uGlobals.u_nic = _nic;
//                                      if (value != null) _nic = value;
//                                    });
//                                  },
//                                  validateFunction: validations.validateNICValue,
//                                ),
//                            ),
//                          ],
//                        ),
                        new Padding(
//              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          padding: const EdgeInsets.fromLTRB(10.00, 10.00, 10.00, 10.00),
                        ),
                        const Divider(
                          height: 1.0,
                        ),
                        new Card(
                          elevation: 3.00,
                          child: new Column(
                            children: <Widget>[
                              new CheckboxListTile(
                                  value: agreed,
                                  title:
                                  const Text('Agreed to the Terms and Conditions.'),
                                  onChanged: (bool value) {
                                    setState(() {
                                      agreed = value;
                                    });
                                  }),
                              new ButtonTheme.bar(
                                // make buttons use the appropriate styles for cards
                                child: new ButtonBar(
                                  children: <Widget>[
                                    new FlatButton(
                                      child: const Text('Read Terms'),
                                      onPressed: () {
                                        /* ... */
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
//                        new Container(
//                          padding: const EdgeInsets.all(20.0),
//                          alignment: Alignment.center,
                          new RoundedButton(
                              buttonName: "Submit",
                              onTap: _handleSubmitted,
                              width: screenSize.width,
                              height: 50.0,
                              bottomMargin: 10.0,
                              borderWidth: 1.0),
//                          new RaisedButton(
//                            child: const Text('SUBMIT'),
//                            onPressed: _handleSubmitted,
//                          ),
//                        ),
                        new Container(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: new Text('* indicates required field',
                              style: Theme.of(context).textTheme.caption),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
//        top: false,
//        bottom: false,
//        child:
      ),
    );
  }
}

//
//class PersonData {
//  String name;
//  String sirName;
//  String phoneNumber;
//  String email;
//  String password;
//  String birthday;
//  String address;
//  String postalCode;
//  String nic;
//  String country;
//  String gender;
//  String division;
//
////  bool agreed = true;
//
//  PersonData(
//      this.name,
//      this.sirName,
//      this.email,
//      this.password,
//      this.phoneNumber,
//      this.birthday,
//      this.gender,
//      this.country,
//      this.division,
//      this.address,
//      this.postalCode,
//      this.nic,
////      this.agreed
//      );
//
//  Map toJson() {
//    return {
//      "name": name,
//      "sir_name": sirName,
//      "email": email,
//      "password": password,
//      "phone_number": phoneNumber,
//      "birthday": birthday,
//      "gender": gender,
//      "country": country,
//      "division": division,
//      "address": address,
//      "postal_code": postalCode,
//      "nic": nic,
////      "agreed": agreed,
//    };
//  }
//}

const jsonCodec = const JsonCodec();

//Future _saveData(PersonData personData) async {
//  var json = jsonCodec.encode(personData);
//  print("json = $json");
//
//  var url = "https://padelmeetdemo.firebaseio.com/personData.json"; //personData.json
//  var httpClient = createHttpClient();
//  var userResponse = await httpClient.post(url, body: json);
//  print("response = " + userResponse.body);
//}

Future _savePersonData(PersonData personData) async {
  var json = jsonCodec.encode(personData);
  print("json = $json");

  var url =
      "https://padelmeetdemo.firebaseio.com/personData.json"; //personData.json
  var httpClient = createHttpClient();
  var userResponse = await httpClient.post(url, body: json);
  print("response = " + userResponse.body);
}

/// Format incoming numeric text to fit the format of (###) ###-#### ##...
class _NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = new StringBuffer();
    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
      if (newValue.selection.end >= 3) selectionIndex += 2;
    }
    if (newTextLength >= 7) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
      if (newValue.selection.end >= 6) selectionIndex++;
    }
    if (newTextLength >= 11) {
      newText.write(newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
      if (newValue.selection.end >= 10) selectionIndex++;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return new TextEditingValue(
      text: newText.toString(),
      selection: new TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
