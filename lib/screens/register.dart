import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;

  // For firebase
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Widget nameText() {
    return TextFormField(
      style: new TextStyle(color: Colors.white),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(width: 1.0, color: Colors.pink[200])),
          // border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(30.0),
          //     borderSide: BorderSide(width: 1.0, color: Colors.pink[200])),
          labelText: 'Name :',
          labelStyle: TextStyle(color: Colors.pink),
          counterStyle: TextStyle(color: Colors.pink),
          hintText: 'Your Name',
          icon: Icon(
            Icons.face,
            color: Colors.pink,
          )),
      validator: (String value) {
        if (value.length == 0) {
          return 'PLease Fill Name In The Blank';
        }
      },
      onSaved: (String value) {
        nameString = value;
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      style: new TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(width: 1.0, color: Colors.pink[200])),
        // border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(30.0),
        //     borderSide: BorderSide(width: 1.0, color: Colors.pink[200])),
        labelText: 'Email :',
        hintText: 'you@email.com',
        labelStyle: TextStyle(color: Colors.pink),
        icon: Icon(
          Icons.email,
          color: Colors.pink,
        ),
      ),
      validator: (String value) {
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(value))
          return 'Enter Valid Email';
        else
          return null;
        // if (value.length == 0) {
        //   return 'PLease Fill Email In The Blank';
        // } else if (!((value.contains('@')) && (value.contains('.')))) {
        //   return 'PLease Fill Email Format';
        // }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      style: new TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(width: 1.0, color: Colors.pink[200])),
        // border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(30.0),
        //     borderSide: BorderSide(width: 1.0, color: Colors.pink[200])),
        labelText: 'Password :',
        hintText: 'more 6 charecter',
        labelStyle: TextStyle(color: Colors.pink),
        // enabledBorder:
        //     UnderlineInputBorder(borderSide: BorderSide(color: Colors.cyan)),
        // focusedBorder: UnderlineInputBorder(
        //   borderSide: BorderSide(color: Colors.black),
        // ),
        icon: Icon(
          Icons.lock,
          color: Colors.pink,
        ),
      ),
      validator: (String value) {
        if (value.length <= 5) {
          return 'PLease Type Password more 6 charecter';
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
      obscureText: true,
    );
  }

  Widget backButton() {
    return RaisedButton(
      child: new Text('back'),
      onPressed: () {
        Navigator.pop(context);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.pink[200],
      textColor: Colors.white,
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      tooltip: 'Upload To Firebase',
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(
              'name = $nameString, email = $emailString, password = $passwordString');
          uploadFunc();
        }
      },
    );
  }

  void uploadFunc() async {
    FirebaseUser firebaseUser = await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Register Success With => $emailString');
    }).catchError((String error) {
      print('HAVE ERROR => $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Register'),
          backgroundColor: Colors.pinkAccent,
          actions: <Widget>[
            uploadButton(),
          ],
          // iconTheme: IconThemeData(
          //   color: Colors.red,
          // ),
          // textTheme: TextTheme(
          //     title: TextStyle(
          //   color: Colors.white,
          //   fontSize: 20.0,
          // )),
        ),
        body: Form(
          key: formKey,
          child: Container(
            // decoration: BoxDecoration(
            //     gradient: RadialGradient(
            //         colors: [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.purple],
            //         radius: 1.5,
            //         center: Alignment(-1, -1))),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(1.0), BlendMode.dstATop),
                image: new AssetImage("images/backgrond.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.only(top: 100.0),
            alignment: Alignment(0, -1),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 8.0),
                  child: nameText(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 8.0),
                  child: emailText(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 8.0),
                  child: passwordText(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0),
                  child: backButton(),
                ),
              ],
            ),
          ),
        ));
  }
}
