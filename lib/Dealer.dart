import 'package:flutter/material.dart';

class Dealer extends StatefulWidget {
  
  @override
  _DealerState createState() => _DealerState();

}

class _DealerState extends State<Dealer> {

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.cyan,
          appBar: AppBar(
            title: Text("Dealer"),
            backgroundColor: Colors.purple,
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text("Back"),
                  leading: Icon(Icons.arrow_back),
                  onTap: () => Navigator.of(context).pushNamed("/DealerLogin"),
                )
              ],
            ),
          ),
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 40.0),
                    alignment: Alignment.topCenter,
                    child: ClipOval(
                      child: Image.asset("images/logo.png"),
                    )
                  ),
                  Padding(
                padding: const EdgeInsets.all(50.0),
                child: RaisedButton(
                  child: Text("BUSY"),
                  color: Colors.purple,
                  onPressed: () => {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.purple)),
                  textColor: Colors.white,
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}