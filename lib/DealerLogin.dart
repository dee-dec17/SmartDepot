import 'package:flutter/material.dart';
import 'Data.dart';
import 'Dealer.dart';

class DealerLogin extends StatefulWidget {
  @override
  _DealerLoginState createState() => _DealerLoginState();
}

class _DealerLoginState extends State<DealerLogin> {
  bool passwordVisible = false;
  
  String _password;
  String dealerId = "";
  var id;
  GlobalKey<FormState> _key = GlobalKey();
  
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
                      child: Image.asset("images/dealer.jpeg"),
                    )
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: TextFormField(
                      validator: (input){
                        id = validateDealer(input);
                        if (id == 0){
                          return "Enter valid Id";
                        }
                        return null;
                      },
                      onSaved: (input){
                        dealerId = input;
                      },
                      decoration: InputDecoration(
                        labelText: "Agent/Dealer Id",
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (val){
                      if(val.length < 6){
                        return "Password too short";
                      }
                      if(val != "123456"){
                        return "Enter valid password";
                      }
                      return null;
                    } ,
                    onSaved: (val) => _password = val,
                    obscureText: passwordVisible,
                    ),
                    trailing: IconButton(icon: Icon(
                // Based on passwordVisible state choose the icon
                          passwordVisible ? Icons.visibility_off : Icons.visibility ,
                          color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                 // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                              passwordVisible = !passwordVisible;
                          });
                    },
                ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: RaisedButton(
                      child: Text("Submit"),
                      color: Colors.purple,
                      onPressed: _sendToNextScreen,
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
  _sendToNextScreen(){
    if( _key.currentState.validate()){
      Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => Dealer(
                shopId: id,
              )
            )
        );
    }
  }
}