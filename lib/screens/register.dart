import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name :', hintText: 'Your Name'),
    );
  }

  Widget emailText() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Email :', hintText: 'you@email.com'),
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password :', hintText: 'more 6 charecter'),
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
      color: Colors.black,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.pink], begin: Alignment(-1, -1))),
        padding: EdgeInsets.only(top: 100.0),
        alignment: Alignment(0, -1),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0),
              child: nameText(),
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
              margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0),
              child: backButton(),
            ),
          ],
        ),
      ),
    );
  }
}
