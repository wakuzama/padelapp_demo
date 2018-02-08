
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditAddress extends StatefulWidget {

  EditAddress({Key key, this.title}) : super(key: key);
  final String title;

  //static const String routeName = "/MyAddressPage";
  static const String routeName = "/pages/EditAddress";

  @override
  EditAddressState createState() => new EditAddressState();

}

class AddressData {
  String addNameDrop = 'Home';
  String addCountryDrop = 'Spain';
  String postalCode = '';
  String addDivision = 'Div 1';
  String addCity = '';
  String addressVal = '';
//bool switchValue = true;
}

class EditAddressState extends State<EditAddress> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  AddressData addressData = new AddressData();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }
  bool _autovalidate = false;
  bool _formWasEdited = false;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

//  final GlobalKey<FormFieldState<String>> _addressFieldKey = new GlobalKey<FormFieldState<String>>();
  final _UsNumberTextInputFormatter _postalcodeFormatter = new _UsNumberTextInputFormatter();

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      showInSnackBar(
          '${addressData.addressVal}\' related postal code is ${addressData
              .postalCode}');
    }
  }

  String _validateAddressVal(String value) {
    _formWasEdited = true;
    if (value.isEmpty) return 'Address is required.';
    final RegExp nameExp = new RegExp(r'^[A-Za-z 0-9 ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  String _validatePostalcode(String value) {
    _formWasEdited = true;
    final RegExp phoneExp =
    new RegExp(r'^[0-9]+$'); //(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
    if (!phoneExp.hasMatch(value))
      return '###-#### - Please enter a valid postal code.';
    return null;
  }

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

  String addNameDrop = 'Home';
  String addCountryDrop = 'Spain';
  String addDivisionDrop = 'Div 1';
  bool switchValue = false;

  @override
  Widget build (BuildContext context){
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
//        title: new Text('Address'),
//        leading: new IconButton(icon: new Icon(Icons.arrow_back),
//          tooltip: "Navigation Menu",
//          onPressed: null,),
        actions: <Widget>[new IconButton(icon: new Icon(Icons.delete, color: Colors.white),
            tooltip: "Delete Item",
            onPressed: null)
        ],
      ),
      body: new Form(
          key: _formKey,
          autovalidate: _autovalidate,
          onWillPop: _warnUserAboutInvalidData,
          child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              new ListTile(
                leading: new Icon(Icons.pin_drop),
                title: const Text('Address Name:'),
                trailing: new DropdownButton<String>(
                  value: addNameDrop,
                  onChanged: (String newValue) {
                    setState(() {
                      addNameDrop = newValue;
                    });
                  },
                  items: <String>['Home', 'Office', 'Travel', 'Other']
                      .map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
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
//                  hint: const Text('Choose'),
                  onChanged: (String newValue) {
                    setState(() {
                      addCountryDrop = newValue;
                    });
                  },
                  items: <String>[
                    'Spain',
                    'France',
                    'England',
                    'Germany',
                    'England',
                    'UK',
                    'Sweden',
                  ].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
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
//                  hint: const Text('Choose'),
                  onChanged: (String newValue) {
                    setState(() {
                      addDivisionDrop = newValue;
                    });
                  },
                  items: <String>[
                    'Div 1',
                    'Div 2',
                    'Div 3',
                    'Div 4',
                    'Div 5',
                    'Div 6',
                    'Div 7',
                  ].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                ),
              ),
//              const SizedBox(
//                height: 12.0,
//              ),
//              new Row(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  new Expanded(
//                    child: new TextFormField(
//                      //key: _passwordFieldKey,
//                      decoration: const InputDecoration(
//                        hintText: 'Where can we reach you',
//                        labelText: 'Postal Code *',
//                      ),
//                      //obscureText: true,
//                      keyboardType: TextInputType.phone,
//                      onSaved: (String value) {
//                        addressData.postalCode = value;
//                      },
//                      validator: _validatePostalcode,
//                      inputFormatters: <TextInputFormatter>[
//                        WhitelistingTextInputFormatter.digitsOnly,
//                        // Fit the validating format.
//                        _postalcodeFormatter,
//                      ],
//                    ),
//                  ),
////                  const SizedBox(width: 16.0),
////                  new Expanded(
////                    child: new TextFormField(
////                      decoration: const InputDecoration(
////                        hintText: 'How can we reach you?',
////                        labelText: 'Division *',
////                      ),
////                      keyboardType: TextInputType.text,
////                      onSaved: (String value) {
////                        addressData.addProvince = value;
////                      },
////                    ),
////                  ),
//                ],
//              ),
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.local_post_office),
                  hintText: 'Where can we reach you',
                  labelText: 'Postal Code *',
                ),
                onSaved: (String value) {
                  addressData.postalCode = value;
                },
                //validator: _validateAddressVal,
              ),
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person_pin),
                  hintText: 'How do poeple find you?',
                  labelText: 'City *',
                ),
                onSaved: (String value) {
                  addressData.addCity = value;
                },
                //validator: _validateAddressVal,
              ),
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person_pin_circle),
                  hintText: 'What is your address?',
                  labelText: 'Street Address *',
                ),
                maxLines: 2,
                //onSaved: (String value) { addressData.addressVal= value; },
                validator: _validateAddressVal,
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
                          switchValue = value;
                        });
                      }
                  ),
//                  ),
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
              new Container(
                padding: const EdgeInsets.only(top: 20.0),
                child: new Text('* indicates required field',
                    style: Theme.of(context).textTheme.caption),
              ),
            ],
          )
//        child: new Column(
//          //child: new Text("Address edit"),
//          children: <Widget>[
//            new RaisedButton(onPressed:(){
//              saveAddressBtn(context);
//            } ,child: new Text("Save"),)
//          ],
//        ),
      ),
    );
  }//build widget
}//state

void saveAddressBtn(BuildContext context) {
  print("save address"); //
  Navigator.of(context).pop(true); //
  // 4

}

class _UsNumberTextInputFormatter extends TextInputFormatter {
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
