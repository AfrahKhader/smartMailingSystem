import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map1 extends StatefulWidget {
  @override
  _PackageState createState() => _PackageState();
}

class _PackageState extends State<Map1> {
  Circle circle;
  LatLng langLat;
  BitmapDescriptor customIcon;

  List<Marker> allMarkers = [];
  Set<Marker> marker;

  @override
  void initState() {
    super.initState();
    marker = Set.from([]);
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
    creatMarker(context);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          title: Center(
            child: Text(
              "ADDRESS",
              style: TextStyle(
                  color: Colors.teal[50], fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.teal[300],
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 500,
              width: 410,
              child: GoogleMap(
                markers: marker,
                onTap: (pos) {
                  print(pos);
                  Marker m = Marker(
                    markerId: MarkerId('myMarker'),
                    icon: customIcon,
                    position: pos,
                  );
                  setState(() {
                    marker.add(m);
//              here the last location of the pin will be store in this variable
                    langLat = pos;
                  });
                },
                onMapCreated: (GoogleMapController controller) {},
                initialCameraPosition: CameraPosition(
                    target: LatLng(21.543333, 39.172779), zoom: 10.0),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              height: 100,
              width: 410,
              child: startButton(),
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
          height: 20,
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
            'SET LOCATION',
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: () {
//            HERE AFTER PRESS SET LOCATION IT SHOULD MOVE THE USER TO HIS PROFILE SHOWING THE LOCATION IN SMALL MAP
            setState(() {});
          },
        ),
      ],
    );
  }
}
