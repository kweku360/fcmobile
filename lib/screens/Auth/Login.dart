import 'dart:convert';

import 'package:fantasy_cup/data/Auth/AuthApi.dart';
import 'package:fantasy_cup/data/Game/GameApi.dart';
import 'package:fantasy_cup/utility/SharedPref.dart';
import 'package:fantasy_cup/utility/TokenUtil.dart';
import 'package:fantasy_cup/widgets/buttons/simpleroundbutton.dart';
import 'package:fantasy_cup/widgets/loaders/loaderone.dart';
import 'package:flutter/material.dart';


class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final usernameField = TextEditingController();
  final passwordField = TextEditingController();
  final List<Color> loaderColors = [
    Colors.green,
    Colors.lightGreenAccent,
    Colors.lightGreen
  ];

  bool showLoader = false;
  bool showError = false;
  String errorText = "";

  void loaderState(bool val) {
    setState(() {
      showLoader = val;
    });
  }

  void errorState(bool val, String txt) {
    setState(() {
      showError = val;
      errorText = txt;
    });
  }

  @override
  initState() {
    super.initState();
    authChecker();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    usernameField.dispose();
    passwordField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
//      appBar: AppBar(
//        title: Text("Sign In To Fantasy Cup"),
//      ),
      body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 80.0,
                  ),
                  Center(
                    // padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 40.0),
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                          image: DecorationImage(
                              image: AssetImage("assets/fpl.png"))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(
                      child: Text("Sign In With FPL Account"),
                    ),
                  ),
                  Visibility(
                    visible: showError,
                    child: Container(
                      width: double.infinity,
                      color: Colors.red,
                      height: 30.0,
                      child: Center(
                        child: Text(
                          errorText,
//                          "Incorrect Username / Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, top: 5.0),
                    child: Text(
                      "Email",
                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Row(
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                          child: Icon(
                            Icons.person_outline,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          height: 30.0,
                          width: 1.0,
                          color: Colors.grey.withOpacity(0.5),
                          margin:
                              const EdgeInsets.only(left: 00.0, right: 10.0),
                        ),
                        new Expanded(
                          child: TextFormField(
                            controller: usernameField,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter FPL Account Email';
                              }
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your email',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      "Password",
                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Row(
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                          child: Icon(
                            Icons.lock_open,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          height: 30.0,
                          width: 1.0,
                          color: Colors.grey.withOpacity(0.5),
                          margin:
                              const EdgeInsets.only(left: 00.0, right: 10.0),
                        ),
                        new Expanded(
                          child: TextFormField(
                            controller: passwordField,
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter FPL Account Password';
                              }
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your password',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: showLoader,
                    child: ColorLoader(
                      colors: loaderColors,
                      duration: Duration(milliseconds: 1500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SimpleRoundButton(
                      backgroundColor: Colors.green,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          if (showLoader == false) {
                            loginVerify(context,usernameField.text, passwordField.text);
                          } else {
                            print("sorry");
                          }
                        }


                        //  Navigator.pushNamed(context, '/fc/login');
                      },
                      buttonText: Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  loginVerify(context,username, password) {
    errorState(false, "");
    loaderState(true);
    new AuthApi().login(username, password).then((val) {
      var jsonObj = json.decode(val);
      print(jsonObj["status"]);
      if (jsonObj["status"] == 0) {
        loaderState(false);
        errorState(true, jsonObj["error"]);
      }
      if (jsonObj["status"] == 1) {
        loaderState(false);
        //write token and some other info
        final token = TokenUtil();
        token.storeToken(jsonObj["data"]["token"]);
        new SharedPref().add("player", jsonEncode(jsonObj["data"])).then((val){
          Navigator.pushNamed(context, '/fc/user/dashboard');
        });
      }
    });
  }

  authChecker(){
    final token = TokenUtil();
    token.checkToken().then((val){
      print("uu");
      print(val);
      if(val == true){
        Navigator.of(_scaffoldKey.currentContext)
            .pushReplacementNamed("/fc/user/dashboard");
      }
    });
  }
}
