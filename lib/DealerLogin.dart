import 'package:flutter/material.dart';

class DealerLogin extends StatefulWidget {
  @override
  _DealerLoginState createState() => _DealerLoginState();
}

class _DealerLoginState extends State<DealerLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[400],
      appBar: AppBar(
        title: Text("Dealer Login"),
        backgroundColor: Colors.purple,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Back"),
              leading: Icon(Icons.arrow_back),
              onTap: () => Navigator.of(context).pushNamed("/HomePage"),
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
                  child: Image.asset("images/dealer.jpeg"),
                )
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: TextFormField(
                  validator: (input){
                    if (input.isEmpty){
                      return "Enter agent Id";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Agent Id",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: RaisedButton(
                  child: Text("Submit"),
                  color: Colors.purple,
                  onPressed: () => {
                    Navigator.pushReplacementNamed(context,"/Dealer"),
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(75.0),
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