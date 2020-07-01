
import 'package:flutter/material.dart';
import 'package:user_location/user_location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'Data.dart';

class SampleMap extends StatefulWidget {
  var call1, call2, call3;
  SampleMap({@required this.call1,@required this.call2,@required this.call3});
  @override
  _SampleMapState createState() => _SampleMapState(call1:call1, call2:call2, call3:call3);
}

class _SampleMapState extends State<SampleMap> {
  var call1, call2, call3;
  _SampleMapState({@required this.call1,@required this.call2,@required this.call3});
  static var latitude = lat1 ,longitude =long1;
  void getLatLong(){
    if(call == 1){
      latitude = lat1;
      longitude = long1;
    }
    else if(call == 2){
      latitude = lat2;
      longitude = long2;
    }
    else if(call == 3){
      latitude = lat3;
      longitude = long3;
    }
  }
  // ADD THIS
  MapController mapController = MapController();
  UserLocationOptions userLocationOptions;
  // ADD THIS
  List<Marker> markers = [Marker(
                width: 1000.0,
                height: 1000.0,
                point:  LatLng(latitude, longitude),
                builder: (ctx) =>
                 Container(
                  child:Icon(Icons.store,color: Colors.deepOrange,)
                ),
              ),];

  @override
  Widget build(BuildContext context) {
    getLatLong();
    // You can use the userLocationOptions object to change the properties
    // of UserLocationOptions in runtime
    userLocationOptions = UserLocationOptions(
                context: context,
                //mapController: mapController,
                markers: markers,
                );
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
          center:  LatLng(latitude,longitude),
          zoom: 14.0,
          plugins: [
             // ADD THIS
              UserLocationPlugin(),
            ],
        ),
        layers: [
           TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a','b','c'],
          ),
          // ADD THIS
            MarkerLayerOptions(markers: markers),
            // ADD THIS
            userLocationOptions,
          ],
          // ADD THIS
          //mapController: mapController,
  ),
      ),
    );
  }

}




