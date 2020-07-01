import 'package:flutter/material.dart';
import 'Data.dart';
import 'Sample.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    print("index1 : $index1, Lat1 = $lat1, long2 = $long1");
    print("lat Type = ${lat1.runtimeType}, long Type = ${long1.runtimeType}");
    print("index2 : $index2, Lat1 = $lat2, long2 = $long2");
    print("lat Type = ${lat2.runtimeType}, long Type = ${long2.runtimeType}");
    print("index3 : $index3, Lat1 = $lat3, long2 = $long3");
    print("lat Type = ${lat3.runtimeType}, long Type = ${long3.runtimeType}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Status"),
        backgroundColor: Colors.purple,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Back"),
              leading: Icon(Icons.arrow_back),
              onTap: () => Navigator.of(context).pushNamed("/UserLogin"),
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Your aloted Depot"),
              subtitle: Text("Shop status : ${shopData[index1][2]}"),
              onTap: (){
                setState(() {
                  call = 1;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SampleMap(
                      call1 : 1,
                      call2 : null,
                      call3 : null,                  )
                  )
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Alternate near by shop1"),
              subtitle: Text("Shop status : ${shopData[index2][2]}"),
              onTap: (){
                setState(() {
                  call = 2;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SampleMap(
                      call1 : null,
                      call2 : 1,
                      call3 : null,
                  )
                  )
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Alternate near by shop2"),
              subtitle: Text("Shop status : ${shopData[index3][2]}"),
              onTap: (){
                setState(() {
                  call = 3;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SampleMap(
                      call1 : null,
                      call2 : null,
                      call3 : 1,
                  )
                  )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}