import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Widget nameText() {
    return TextFormField(
      style: new TextStyle(color: Colors.white),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(width: 1.0, color: Colors.pink[200])),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(width: 1.0, color: Colors.pink[200])),
          labelText: 'Name :',
          labelStyle: TextStyle(color: Colors.pink),
          counterStyle: TextStyle(color: Colors.pink),
          hintText: 'Your Name',
          icon: Icon(
            Icons.face,
            color: Colors.pink,
          )),
    );
  }

  Widget emailText() {
    return TextFormField(
      style: new TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(width: 1.0, color: Colors.pink[200])),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(width: 1.0, color: Colors.pink[200])),
        labelText: 'Email :',
        hintText: 'you@email.com',
        labelStyle: TextStyle(color: Colors.pink),
        icon: Icon(
          Icons.email,
          color: Colors.pink,
        ),
      ),
    );
  }

  Widget passwordText() {
    return TextFormField(
      style: new TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(width: 1.0, color: Colors.pink[200])),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(width: 1.0, color: Colors.pink[200])),
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
      onPressed: (){},
    );
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
      body: Container(
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
    );
  }
}
