

class Validations{

  bool _formWasEdited = false;

  String validateName(String value) {
    if (value.isEmpty) return 'Name is required.';
    _formWasEdited = true;
    final RegExp nameExp = new RegExp(r'^[A-za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  String validateEmail(String value) {
    if (value.isEmpty) return 'Email is required.';
    _formWasEdited = true;
    final RegExp nameExp = new RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9_]+?\.[a-zA-Z]{2,3}$');
    if (!nameExp.hasMatch(value)) return 'Invalid email address';
    return null;
  }

  String validatePassword(String value) {    
    if (value.isEmpty) return 'Please choose a password.';
    _formWasEdited = true;
    final RegExp passExp = new RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,10}$');
    if(!passExp.hasMatch(value)) return 'Password must be between 6 and 10 characters long, and must include at least one upper case letter, one lower case letter, and one numeric digit';
    return null;
  }



  String validatePhoneNumber(String value) {
    if (value.isEmpty) return 'Phone Number is required.';
    _formWasEdited = true;
    final RegExp phoneExp = new RegExp(r'^\(\d\d\d\) \d\d\d-\d\d\d\d$');
    if (!phoneExp.hasMatch(value)&& value.length < 10)
      return '(###)###-#### - Please enter a valid phone number.';
    return null;
  }

  String validateBirthday(String value) {
//    _formWasEdited = true;
    if (value.isEmpty) return 'Birthday is required.';
    _formWasEdited = true;
    final RegExp bdayExp = new RegExp(r'^(0?[1-9]|[12][0-9]|3[01])[/ -](0?[1-9]|1[12])[/ -](19[0-9]{2}|[2][0-9][0-9]{2})$');//(r'^[A-Za-z 0-9]+$');
    if (!bdayExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  String validatePostalcode(String value) {
//    _formWasEdited = true;
    if (value.isEmpty) return 'Postal Code is required.';
    _formWasEdited = true;
    final RegExp phoneExp =
    new RegExp(r'^[0-9]{5,8}$'); //(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
    if (!phoneExp.hasMatch(value))
      return '###-#### - Please enter a valid postal code.';
    return null;
  }

  String validateNICValue(String value) {
//    _formWasEdited = true;
    if (value == null) return 'NIC value required';
    _formWasEdited = true;
    final RegExp nicExp = new RegExp(r'^[A-Za-z 0-9]+$');
    if (!nicExp.hasMatch(value)) return 'Please enter a valid number';
    return null;
  }
}

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

