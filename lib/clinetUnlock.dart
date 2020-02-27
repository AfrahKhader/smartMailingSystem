import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing_app/PackageDetailes.dart';
import 'package:testing_app/Unlock.dart';
import 'Address.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class unlock extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<unlock> {
  final List<String> adresses = [
    '44443',
    '22224',
  ];
  final String name = "Dalia Salim";

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
                    padding: const EdgeInsets.only(right: 270),
                    child: Text(
                      'My Orders',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              height: 150,
              child: Column(
                children: <Widget>[
                  ordersButtons('Awaiting Delivery'),
                  ordersButtons('Delivered Packages'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  height: 200,
                  width: 150,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Text(
                          'MAILBOX',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Text(
                          'Mailbox Status',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.blueGrey,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              disabledTextColor: Colors.black,
                              splashColor: Colors.white,
                              child: Container(
                                height: 40,
                                width: 100,
                                child: Center(
                                  child: Text(
                                    "Empty",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              onPressed: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  height: 200,
                  width: 260,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 50, top: 10),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                disabledTextColor: Colors.black,
                                color: Colors.teal[300],
                                splashColor: Colors.white,
                                child: Container(
                                  height: 170,
                                  width: 130,
                                  child: Center(
                                      child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Image.asset("images/unlock.png"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Unlock Box",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17))
                                    ],
                                  )),
                                ),
                                onPressed: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget ordersButtons(String text) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 20,
        ),
        FlatButton(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.blueGrey, width: 1, style: BorderStyle.solid),
            borderRadius: new BorderRadius.circular(10.0),
          ),
          disabledTextColor: Colors.black,
          splashColor: Colors.white,
          child: Container(
            height: 40,
            width: 150,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          onPressed: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => );
          },
        ),
      ],
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
