
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocation/geolocation.dart';

class SampleMap extends StatelessWidget {
  var lat;
  var long;

  SampleMap({@required this.lat,@required this.long, final edit = false});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            title: Text("Shop Location"),
            backgroundColor: Colors.purple,
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text("Back"),
                  leading: Icon(Icons.arrow_back),
                  onTap: () => Navigator.of(context).pushNamed("/User"),
                )
              ],
            ),
          ),
          body: Container(
        child: FlutterMap(
        options:  MapOptions(
          center:  LatLng(lat,long),
          zoom: 15.0,
        ),
        layers: [
           TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a','b','c'],
          ),
          MarkerLayerOptions(
            markers: [
               Marker(
                width: 80.0,
                height: 80.0,
                point:  LatLng(lat, long),
                builder: (ctx) =>
                 Container(
                  child:Icon(Icons.location_on,color: Colors.red,)
                ),
              ),
              
            ],
          )
        ],
  ),
      ),
    );
  }
}
