import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing_app/PackageDetailes.dart';
import 'package:testing_app/Unlock.dart';
import 'package:testing_app/clinetUnlock.dart';
import 'Address.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(My());
}

class My extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<My> {
  final List<String> adresses = [
    '44443',
    '22224',
  ];
  final String name = "Mohammad Salim";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          title: Center(
            child: Text(
              "MAIN PAGE",
              style: TextStyle(
                  color: Colors.teal[50], fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.teal[300],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.teal[300]),
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Row(children: <Widget>[
                    SizedBox(
                      width: 140.0,
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12.0),
                      ),
                      color: Colors.white,
                      textColor: Colors.black,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Colors.white,
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      onPressed: () {
                        setState(() {
                          print('edit button');
                        });
                      },
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    IconButton(
                      icon: Icon(Icons.exit_to_app),
                      color: Colors.black,
                      highlightColor: Colors.white,
                      onPressed: () {
                        print('out button pressed');
                      },
                    ),
                  ])
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              height: 60,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 250),
                    child: Text(
                      'Packages To Deliver',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: new ListView.builder(
                  itemCount: adresses.length,
                  itemBuilder: (BuildContext context, int index) =>
                      CardAdress(context, index)),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              height: 90,
              child: startButton(),
            )
          ],
        ),
      ),
    );
  }

  Widget CardAdress(BuildContext context, int index) {
    return new Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Text(
              adresses[index],
              style: TextStyle(fontSize: 15),
            ),
            Spacer(),
            Container(
              width: 90,
              height: 20,
              child: FlatButton(
                disabledTextColor: Colors.black,
                splashColor: Colors.white,
                child: Text(
                  'Unlock Box',
                  style: TextStyle(
                      fontSize: 11.0,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => unlock()));
                },
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.info_outline,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Package(name)));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget startButton() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        FlatButton(
          padding: EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
          ),
          color: Colors.yellow[700],
          textColor: Colors.black,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          splashColor: Colors.white,
          child: Text(
            'CREAT A PLAN',
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: () {
            setState(() {
              print('edit button');
            });
          },
        ),
      ],
    );
  }
}

class User {
//  final String fName;
//  final String lName;
//  final String id;
}
