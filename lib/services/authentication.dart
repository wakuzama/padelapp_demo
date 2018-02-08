import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:padelapp_demo/model/register_entry.dart';


//class UserData {
//
//  String displayName;
//  String email;
//  String uid;
//  String password;
//
//  UserData({this.displayName, this.email, this.uid, this.password});
//}

class UserAuth {
  String statusMsg="Account Created Successfully";
  //To create new User
  Future<String> createUser(PersonData personData) async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(
        email: personData.email, password: personData.password);
    return statusMsg;
  }

  //To verify new User
  Future<String> verifyUser (PersonData personData) async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(email: personData.email, password: personData.password);
    return "Login Successfull";
  }
}