import 'package:flutter/material.dart';
import 'Data.dart';
class Dealer extends StatefulWidget {
  var shopId;
  Dealer({@required this.shopId});
  @override
  _DealerState createState() => _DealerState(shopId:shopId);

}

class _DealerState extends State<Dealer> {
  var shopId;
  _DealerState({@required this.shopId});
  bool _status = true;

  String stat ;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _status = !_status;
      updateShopStatus(shopId,_status);
    });
  }

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
                  Padding(padding: EdgeInsets.all(50.0),
                  child :RaisedButton(
                  color: Colors.purple,
                  onPressed: () {_toggle();
                  },
                  child: new Text(_status ? "Busy" : "Available"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.purple)),
                  textColor: Colors.white,
                  )
                ),
                Text("Shop is currently : ${shopData[shopId][2]}"),
            ],
          ),
        ),
      ),
    );
  }
}