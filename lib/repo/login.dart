import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:padelapp_demo/components/rounded_button.dart';
import 'package:padelapp_demo/components/text_button.dart';
import 'package:padelapp_demo/model/register_entry.dart';
import 'package:padelapp_demo/pages/register_dialog.dart';
import 'package:padelapp_demo/services/authentication.dart';
import 'package:padelapp_demo/services/validations.dart';
import 'package:padelapp_demo/components/inputField.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:padelapp_demo/theme/style.dart';
//import 'register.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key key}) : super(key: key);
//  final String title;
  static const String routeName = "./LoginPage";

  @override
  LoginPageState createState() => new LoginPageState();
}

final mainReferenceUser = FirebaseDatabase.instance.reference();

class LoginPageState extends State<LoginPage>{

//  List<PersonData> dataSaves = new List();
  ScrollController _listViewScrollController = new ScrollController();
  double _itemExtent = 5.0;
  BuildContext context;
  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  ScrollController scrollController = new ScrollController();
  PersonData user = new PersonData();
  UserAuth userAuth = new UserAuth();
  bool autoValidate = false;
  Validations validations = new Validations();

//  var validateFunction;
//  var onSaved;
//  Key key;

  GoogleSignIn _googleSignIn = new GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<Null> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      print("signed in:" + _googleSignIn.currentUser.displayName);
      String userNameGoogle = _googleSignIn.currentUser.displayName;
      _submitWelcomePage;
//      _gotoRegisterPage();
//    Navigator.of(context).pushNamedAndRemoveUntil('/MyHomePage', (Route<dynamic> route) => false);
    } catch (error) {
      print(error);
    }
  }
  Future<Null> _handleSignOut() async {
    _googleSignIn.disconnect();
  }

  _onPressed(){
    print("button clicked");
  }
  onPressed(String routeName){
    Navigator.of(context).pushNamed(routeName);
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

//  void _handleSubmitted() {
//    final FormState form = _formKey.currentState;
//    if (!form.validate()) {
//      _autovalidate = true;  // Start validating on every change.
//      showInSnackBar('Please fix the errors in red before submitting.');
//    } else {
//      form.save();
//      showInSnackBar('${person.name}\'s phone number is ${person.phoneNumber}');
////      Navigator.pushNamed(context, MyHomePage.routeName);
//      Navigator.of(context).pushNamedAndRemoveUntil('/MyHomePage', (Route<dynamic> route) => false);
//    }
//  }

  void _handleSubmitted(){
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      autoValidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      userAuth.verifyUser(user).then((onValue) {
        if (onValue == "Login Successfull")
          Navigator.pushNamed(context, "/MyHomePage");
        else
          showInSnackBar(onValue);
      }).catchError((PlatformException onError) {
        showInSnackBar(onError.message);
      });
    }
  }



  @override
  Widget build(BuildContext context) {

    var assetImageG = new AssetImage("assets/google_signin.jpg");
    var googleImage = new Image(image: assetImageG, height: 65.0, width: 310.0);
    var assetImageF = new AssetImage("assets/facebook_signin.jpg");
    var facebookImage = new Image(image: assetImageF, height: 65.0, width: 310.0);
    var assetImageL = new AssetImage("assets/login_sign.png");
    var loginImage = new Image(image: assetImageL, height: 65.0, width: 310.0);
    var assetImageLu = new AssetImage("assets/login_user.png");
    var assetImageLogo = new AssetImage("assets/logo_launch.png");
    var launch_logo = new Image(image: assetImageLogo, height: 124.0, width: 124.0);

    final Size screenSize = MediaQuery.of(context).size;
    //print(context.widget.toString());
    this.context = context;
    Validations validations = new Validations();

    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
//        title: new Text(widget.title),
      ),
      body:
//      new SingleScrollView(
//        controller: scrollController,
//        child:
 new Container(
          padding: new EdgeInsets.all(16.0),
        // decoration: with the background image here
        child: new Column(
        children: <Widget>[
          new Container(
            height: 132.00,//screenSize.height / 2,
//            child: new Padding(
//              padding: const EdgeInsets.fromLTRB(20.00, 10.00, 10.00, 10.00),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                new Center(
                child: new Image(
                image: logo,
                width: launch_logo.width,
//                (screenSize.width < 500)
//                    ? 120.0
//                    : (screenSize.width / 4) + 12.0,
                height: launch_logo.height,
                //screenSize.height / 4 + 20,
              ),
            ),
                ],
          ),
        ),

//                  new InputField(
//                      hintText: "Email",
//                      obscureText: false,
//                      textInputType: TextInputType.text,
////                      textStyle: textStyle,
////                      textFieldColor: textFieldColor,
//                      icon: Icons.mail_outline,
//                      iconColor: Colors.white,
//                      bottomMargin: 20.0,
//                      validateFunction: validations.validateEmail,
//                      onSaved: (String email) {
//                        user.email = email;
//                      }),
//                  new InputField(
//                      hintText: "Password",
//                      obscureText: true,
//                      textInputType: TextInputType.text,
////                      textStyle: textStyle,
////                      textFieldColor: textFieldColor,
//                      icon: Icons.lock_open,
//                      iconColor: Colors.white,
//                      bottomMargin: 30.0,
//                      validateFunction:
//                      validations.validatePassword,
//                      onSaved: (String password) {
//                        user.password = password;
//                      }),
//                  new TextFormField(
//                    decoration: const InputDecoration(
//                      icon: const Icon(Icons.person),
//                      hintText: 'What do people call you?',
//                      labelText: 'Name *',
//                    ),
//                    onSaved: (String value) { person.name = value; },
//                    validator: _validateName,
//                  ),
//                  new TextFormField(
//                    decoration: const InputDecoration(
//                      hintText: "Email",
//                      labelText: "Email",
//                      icon: const Icon(Icons.mail_outline, )
//                    ),
////                      validator: validateFunction,
////                      onSaved: onSaved,
//                      key: key,
//                      validator: validations.validateEmail,
//                      onSaved: (String email) {
//                        user.email = email;
//                      }),
//                  new TextFormField(
//                    decoration: const InputDecoration(
//                      hintText: "Password",
//                      icon: const Icon(Icons.lock_open,),
//                    ),
//                      key: key,
//                      validator: validations.validatePassword,
//                      onSaved: (String password) {
//                        user.password = password;
//                      }),
//                  new Container(
//                    height: loginUImage.height,
//                    width: loginUImage.width,
//                    child: new FlatButton(
//                      onPressed: _handleSubmitted,
//                      child: new ConstrainedBox(
//                        constraints: new BoxConstraints.expand(),
//                        child: loginUImage,
//                      ),
//                    ),
//                  ),
                  new Container(
                    height: 392.00,//screenSize.height / 4,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center ,
                      children: <Widget>[
                        new Form(
                          key: _formKey,
                            autovalidate: autoValidate,
                            child: new Column(
                              children: <Widget>[
                                new InputField(
                                  hintText: "Email",
                                  obscureText: false,initialValue: "",
                                    textInputType: TextInputType.text,
                                    textStyle: new TextStyle(color: Colors.indigo),
                                    textFieldColor: textFieldColor,
                                    icon: Icons.mail_outline,
                                    iconColor: Colors.indigo,
                                    bottomMargin: 24.0,
                                    validateFunction: validations.validateEmail,
                                    onSaved: (String email) {
                                      user.email = email;
                                    }),
                                  new InputField(
                                      hintText: "Password",
                                      obscureText: true, initialValue: "",
                                      textInputType: TextInputType.text,
                                      textStyle: new TextStyle(color: Colors.indigo),
                                      textFieldColor: textFieldColor,
                                      icon: Icons.lock_open,
                                      iconColor: Colors.indigo,
                                      bottomMargin: 25.0,
                                      validateFunction: (validations) =>
                                      validations.length < 6 ? 'Password Incorrect': null,//validations.validatePassword,
                                      onSaved: (String password) {
                                        user.password = password;
                                      }),
                                new RoundedButton(
                                  buttonName: "Get Started",
                                  onTap: _handleSubmitted,
                                  width: screenSize.width,
                                  height: 50.0,
                                  bottomMargin: 12.0,
                                  borderWidth: 0.0,
                                  buttonColor: primaryColor,
                                ),
                              ],
                            ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new TextButton(
                                buttonName: "Create Account",
                                onPressed: () => onPressed("/RegisterPage"),
                                buttonTextStyle: new TextStyle(color: Colors.indigo)),
                            new TextButton(
                                buttonName: "Need Help?",
                                onPressed: _onPressed,
                                buttonTextStyle: new TextStyle(color: Colors.indigo))
                          ],
                        ),
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
//                            const SizedBox(height: 12.0),
                  const Divider(
                    height: 2.0,
                  ),
                  new Text('Or'),
                  const Divider(
                    height: 2.0,
                  ),
                  new Container(
                    height: googleImage.height,
                    width: googleImage.width,
                    child: new FlatButton(
                      onPressed: _submitGooglePage,
                      child: new ConstrainedBox(
                        constraints: new BoxConstraints.expand(),
                        child: googleImage,
                      ),
                    ),
                  ),
//                  new Container(
//                    height: facebookImage.height,
//                    width: facebookImage.width,
//                    child: new FlatButton(
//                      onPressed: _submitFacebookPage,
//                      child: new ConstrainedBox(
//                        constraints: new BoxConstraints.expand(),
//                        child: facebookImage,
//                      ),
//                    ),
//                  ),
                  new Container(
//                    const SizedBox(height: 8.0),
//                    new Container(
                      height: 40.00, width: 200.00,
                      child: new FlatButton(
                        child: const Text('Go In'),
                        onPressed: _toMainPage,
                        color: Colors.grey,
//                      ),
                    ),
                  ),
//                  const SizedBox(height: 12.0),
                          ],
                        ),
                    ],
                        ),
                  ),
                ],
    ),
    )
//    )
    );

//                      new Container(
//                        height: loginImage.height,
//                        width: loginImage.width,
//                        child: new FlatButton(
//                          onPressed: _submitRegisterPage,
//                          child: new ConstrainedBox(
//                            constraints: new BoxConstraints.expand(),
//                            child: loginImage,
//                          ),
//                        ),
//                      ),
//                      ],
//                    ),


//                  const SizedBox(height: 12.0),
//                  const Divider(
//                    height: 1.6,
//                  ),
//                  new Text('Or Use'),
//                  const Divider(
//                    height: 2.0,
//                  ),
//                  const SizedBox(height: 12.0),
//                  new Container(
//                    height: googleImage.height,
//                    width: googleImage.width,
//                    child: new FlatButton(
//                      onPressed: _submitGooglePage,
//                      child: new ConstrainedBox(
//                        constraints: new BoxConstraints.expand(),
//                        child: googleImage,
//                      ),
//                    ),
//                  ),
//                  const SizedBox(height: 8.0),
//                  new Container(
//                    height: facebookImage.height,
//                    width: facebookImage.width,
//                    child: new FlatButton(
//                      onPressed: _submitFacebookPage,
//                      child: new ConstrainedBox(
//                        constraints: new BoxConstraints.expand(),
//                        child: facebookImage,
//                      ),
//                    ),
//                  ),
//                  const SizedBox(height: 8.0),
//                    new Container(
//                      height: 40.00, width: 200.00,
//                      child: new FlatButton(
//                        child: const Text('Go In'),
//                        onPressed: _toMainPage,
//                        color: Colors.grey,
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//        ],
//        );
//      ),
//      ),

//    );
  }

  void _submitRegisterPage() {
    Navigator.of(context).pushNamed('/RegisterPage');
//    Navigator.of(context).pushNamed('/pages/RegisterDlg');
  }

//  Future _submitRegisterPage() async{
//    PersonData save = await
//    Navigator.of(context).push(new MaterialPageRoute<PersonData>(
//        builder: (BuildContext context){
//          return new RegisterDlg.add(
//              dataSaves.isNotEmpty ? dataSaves.last.address: 'address');
//
//        },
//        fullscreenDialog: true));
//    if (save != null) {
//      mainReferenceUser.push().set(save.toJson());
////    _addAddressSave(save);
//    }
//  }

  void _submitWelcomePage(){
    Navigator.of(context).pushNamed('/WelcomePage');
  }
  void _submitFacebookPage() {

  }

//  void _gotoRegisterPage() {
//    Navigator.of(context).pushNamed('/RegisterPage');
//  }

  void _submitGooglePage(){
    _handleSignIn();
  }

//  void _gotoRegisterPage() {
//    Navigator.of(context).pushNamed('/RegisterPage');
//  }

//  void _submitLogin() {
//  }

  void _toMainPage() {
    Navigator.of(context).pushNamed('/MyHomePage');
  }
}

////////////////////////// google sign in  /////////////////////
//
//class GoogleSignIn extends StatefulWidget {
//
//  @override
//  State createState() => new GoogleSignInState();
//}
//
//class GoogleSignInState extends State<GoogleSignIn>{
//
//  GoogleSignInAccount _currentUser;
//  String _contactText;
//
//  @override
//  Widget build(BuildContext context) {
//
//  }
//}
