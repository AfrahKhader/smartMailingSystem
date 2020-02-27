import 'package:flutter/material.dart';
import 'package:testing_app/Unlock.dart';
import 'package:testing_app/main.dart';
import 'package:testing_app/map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Package extends StatefulWidget {
  @override
  String name;
  Package(this.name);
  _PackageState createState() => _PackageState(this.name);
}

class _PackageState extends State<Package> {
  @override
  String name;
  _PackageState(this.name);

  Circle circle;
  LatLng langLat;
  BitmapDescriptor customIcon;
  List<Marker> allMarkers = [];
  Set<Marker> marker;

  @override
  void initState() {
    super.initState();
    marker = Set.from([]);
    marker.add(Marker(
      markerId: MarkerId('myMarker'),
      icon: customIcon,
      position: LatLng(21.474170243336367, 39.243308901786804),
    ));
  }

  creatMarker(context) {
    if (customIcon == null) {
      ImageConfiguration configuration = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(configuration, 'images/pin.png')
          .then((icon) {
        setState(() {
          customIcon = icon;
        });
      });
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 110),
            child: Text(
              "PACKAGE DETAIL",
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
              height: 400,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: <Widget>[
                      Info('Name:      ', 'Dalia Salim'),
                      Info('Phone:     ', '05643234'),
                      Info('Order No.: ', '44443'),
                      Info('Wiegth:     ', '0.5 KG'),
                      location(),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: Align(
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => My()));
            },
          ),
          alignment: Alignment(-0.85, -0.85),
        ),
      ),
    );
  }

  Widget Info(String title, String content) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            content,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget location() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text(
                'Address:',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          width: 400,
          child: GoogleMap(
            markers: marker,
            onMapCreated: (GoogleMapController controller) {},
            initialCameraPosition:
                CameraPosition(target: LatLng(21.543333, 39.172779), zoom: 8),
          ),
        ),
      ],
    );
  }
}
