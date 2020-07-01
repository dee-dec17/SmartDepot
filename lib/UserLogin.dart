import 'package:flutter/material.dart';
import 'package:smartdepot/Data.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  String rNumber;
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.yellow[400],
          appBar: AppBar(
            title: Text("User Login"),
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
          body: SingleChildScrollView(
                      child: Form(
              key: _key,
                        child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                       Container(
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 40.0),
                        alignment: Alignment.topCenter,
                        child: ClipOval(
                          child: Image.asset("images/user.jpeg"),
                        )
                      ),
                      ListTile(
                        leading: Icon(Icons.person),
                        title: TextFormField(
                          validator: (input){
                            if (alotedShop(input) == 0){
                              return "Enter valid Ration card number";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Ration Card Number",
                          ),
                          onSaved: (input) => rNumber = input,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: RaisedButton(
                      child: Text("Submit"),
                      color: Colors.purple,
                      onPressed: sendToNextPage,
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
            ),
          ),
    );
  }
  void  sendToNextPage(){
    if( _key.currentState.validate()){
      setState(() {
      Navigator.pushReplacementNamed(context,"/User");
      lat1 = double.parse(shopData[index1][4]);
      long1 = double.parse(shopData[index1][3]);
      });
  }
  }
}