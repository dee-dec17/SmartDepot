import 'package:flutter/material.dart';
import 'Sample.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  
  String stat = "Busy", statn = "Not Busy";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              title: Text("Your Depot"),
              subtitle: Text("Shop status : $stat"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SampleMap(
                      lat : 17.32904318,
                      long : 82.61113
                  )));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Alternate near by shop1"),
              subtitle: Text("Shop status : $statn"),
              onTap: (){
                Navigator.pushReplacementNamed(context, "/HomePage");
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Alternate near by shop2"),
              subtitle: Text("Shop status : $stat"),
              onTap: (){},
            ),
            Divider(),
            // RaisedButton(
            //   color: Colors.purple,
            //   child: Text("Map"),
            //   onPressed: (){},
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(75.0),
            //     side: BorderSide(color: Colors.purple),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}