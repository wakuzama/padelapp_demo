import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class UserDetails extends StatefulWidget {
  UserDetails({Key key, this.title}) : super(key: key);
  final String title;

  static const String routeName = "/pages/UserDetails";

  @override
  _UserDetailsState createState() => new _UserDetailsState();
}

class UserData{
  String userFName = 'Home';
  String userLName = '';
  String userEmail = '';
  String userContact = '';
  String userAddress = 'address';
  String userBday = 'dd/mm/yyyy';
}

class _UserDetailsState extends State<UserDetails> {

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  UserData userData = new UserData();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  final _UsNumberTextInputFormatter  _postalcodeFormatter = new _UsNumberTextInputFormatter();

  bool _autovalidate = false;
  bool _formWasEdited = false;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      showInSnackBar(
          '${userData.userFName}+ ${userData.userLName}\' Your contact details are being saved.');
    }
  }

  String _validateFirstName(String value) {
    _formWasEdited = true;
    if (value.isEmpty) return 'First Name Cannot be Empty';
    final RegExp fnameExp = new RegExp(r'^[A-Za-z ]+$');
    if (!fnameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  String _validateLastName(String value) {
    _formWasEdited = true;
    if (value.isEmpty) return 'Last Name Cannot be Empty.';
    final RegExp lnameExp = new RegExp(r'^[A-Za-z ]+$');
    if (!lnameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }
  String _validateContactNum(String value) {
    _formWasEdited = true;
    if (value == null) return 'Contact Number Required';
    final RegExp contactExp = new RegExp(r'^[0-9 ]+$');
    if (!contactExp.hasMatch(value))
      return 'Please enter only numbers.';
    return null;
  }
//  String _validateEmail(String value) {
//    _formWasEdited = true;
//    if (value.isEmpty) return 'Email Address is required.';
//    final RegExp emailExp = new RegExp(r'^[A-Za-z 0-9 ]+$');
//    if (!emailExp.hasMatch(value))
//      return 'Please enter valid email.';
//    return null;
//  }
  String _validateAddress(String value) {
    _formWasEdited = true;
    if (value.isEmpty) return 'Address is required.';
    final RegExp addressExp = new RegExp(r'^[A-Za-z 0-9]+$');
    if (!addressExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }
  String _validateBirthday(String value) {
    _formWasEdited = true;
    if (value.isEmpty) return 'Birthday is required.';
    final RegExp bdayExp = new RegExp(r'^[A-Za-z 0-9]+$');
    if (!bdayExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }
//  String _validatePostalcode(String value) {
//    _formWasEdited = true;
//    final RegExp phoneExp =
//    new RegExp(r'^[0-9]+$'); //(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
//    if (!phoneExp.hasMatch(value))
//      return '###-#### - Please enter a valid postal code.';
//    return null;
//  }
  Future<bool> _warnUserAboutInvalidData() async {
    final FormState form = _formKey.currentState;
    if (form == null || !_formWasEdited || form.validate()) return true;

    return await showDialog<bool>(
      context: context,
      child: new AlertDialog(
        title: const Text('This form has errors'),
        content: const Text('Usaved Data will be disposed,\ Sure to Exit the form?'),
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



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('Contact Info'),
//        leading: new IconButton(icon: new Icon(Icons.arrow_back),
//          tooltip: "Navigation Menu",
//          onPressed: null,),
        actions: <Widget>[new IconButton(icon: new Icon(Icons.edit,color: Colors.white),
            tooltip: "Edit Details",
            onPressed: null)
        ],
      ),
      body: new Form(
        key: _formKey,
        autovalidate: _autovalidate,
        onWillPop: _warnUserAboutInvalidData,
        child: new ListView(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          children: <Widget>[
            new TextFormField(
              decoration: const InputDecoration(
//                  icon: const Icon(Icons.person_pin),
                hintText: 'first name',
                labelText: 'Frist Name:*',
              ),
              maxLines: 1,
              validator: _validateFirstName,
              onSaved: (String value) {
                userData.userFName = value;
              },
              //validator: _validateAddressVal,
            ),
            new TextFormField(
              decoration: const InputDecoration(
//                  icon: const Icon(Icons.person_pin),
                hintText: 'last name',
                labelText: 'Last Name:*',
              ),
              maxLines: 1,
              validator: _validateLastName,
              onSaved: (String value) {
                userData.userLName = value;
              },
              //validator: _validateAddressVal,
            ),
            new TextFormField(
              decoration: const InputDecoration(
//                  icon: const Icon(Icons.person_pin),
                hintText: 'Emails are better:',
                labelText: 'E-mail:*',
              ),
              maxLines: 1,
              validator: (value) =>
              !value.contains('@') ? 'Not a valid email.' : null,
//                onSaved: (val) => userEmail = val,
              onSaved: (String value) {
                userData.userEmail = value;
              },
              //validator: _validateAddressVal,
            ),
            new TextFormField(
              decoration: const InputDecoration(
//                  icon: const Icon(Icons.person_pin),
                hintText: 'How can people contact you?',
                labelText: 'Contact Number:*',
              ),
              maxLines: 1,
              validator: _validateContactNum,
              onSaved: (String value) {
                userData.userContact = value;
              },
              //validator: _validateAddressVal,
            ),
            new TextFormField(
              decoration: const InputDecoration(
//                  icon: const Icon(Icons.person_pin),
                hintText: 'How can people find you?',
                labelText: 'Address:*',
              ),
              maxLines: 1,
              validator: _validateAddress,
              onSaved: (String value) {
                userData.userAddress = value;
              },
              //validator: _validateAddressVal,
            ),
            new TextFormField(
              decoration: const InputDecoration(
//                  icon: const Icon(Icons.person_pin),
                hintText: 'When is the celebration?',
                labelText: 'Birthdate:',
              ),
              maxLines: 1,
              validator: _validateBirthday,
              onSaved: (String value) {
                userData.userBday = value;
              },
              //validator: _validateAddressVal,
            ),
            new Container(
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: new RaisedButton(
                child: const Text('Save'),
                onPressed: _handleSubmitted,
              ),
            ),
            new Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: new Text('* fields are required ',
                  style: Theme.of(context).textTheme.caption),
            ),
          ],
        ),
      ),
    );
  }
}

void saveUserDetailsBtn(BuildContext context) {
  print("Save Details"); //
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