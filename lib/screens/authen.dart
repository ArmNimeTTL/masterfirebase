import 'package:flutter/material.dart';
import 'package:masterfirebase/screens/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // For Form
  final formKey = GlobalKey<FormState>();

  // constant
  String titleSpace = 'กรุณากรอกข้อมูลให้ครบค่ะ';
  String titleEmailFalse = 'กรุณากรอกรูปแบบ Email ให้ถูกต้อง';
  String titlePasswordFalse = 'รหัสต้องมีมากกว่า 6 ตัวอักษร';

  // Explicit
  String emailString, passwordString;

  Widget emailText() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Email :', hintText: 'you@email.com'),
      validator: (String value) {
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern);
        if (value.length == 0) {
          return titleSpace;
        } else if (!regex.hasMatch(value)) {
          return titleEmailFalse;
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password :', hintText: 'more 6 charecter'),
      obscureText: true,
      validator: (String value) {
        if (value.length <= 5) {
          return titlePasswordFalse;
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  Widget singinButton() {
    return RaisedButton.icon(
      icon: Icon(Icons.check),
      label: Text('Sign In'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.pink[400],
      textColor: Colors.white,
      onPressed: () {
        print('test test test test');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('email ==>> $emailString, password ==>> $passwordString');
        }
      },
    );
  }

  Widget singupButton(BuildContext context) {
    return RaisedButton.icon(
      icon: Icon(Icons.perm_contact_calendar),
      label: Text('Sign Up'),
      onPressed: () {
        var registerRoute = MaterialPageRoute(builder: (context) => Register());
        Navigator.of(context).push(registerRoute);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => Register()),
        // );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.pink[200],
      textColor: Colors.white,
    );
  }

  Widget showAppName() {
    return Text(
      'Master Rose',
      style: TextStyle(
          fontFamily: 'Lobster',
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
          color: Colors.pinkAccent),
    );
  }

  Widget showLogo() {
    return Image.asset('images/rose.gif');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: formKey,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.pink, Colors.white],
                    begin: Alignment(-1, -1))),
            // decoration: new BoxDecoration(
            //   image: new DecorationImage(
            //     image: new AssetImage("images/backgrond.jpg"),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            padding: EdgeInsets.only(top: 100.0),
            alignment: Alignment(0, -1),
            child: Column(
              children: <Widget>[
                Container(
                  width: 300.0,
                  height: 200.0,
                  child: showLogo(),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.0),
                  child: showAppName(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: emailText(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: passwordText(),
                ),
                Container(
                    margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(left: 4.0, right: 4.0),
                                child: singinButton())),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(left: 4.0, right: 4.0),
                                child: singupButton(context))),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
