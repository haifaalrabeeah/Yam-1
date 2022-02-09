import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yam/Login/LoginPage.dart';

class InputField3 extends StatelessWidget{
  @override

  TextEditingController _emailContoller = TextEditingController();
  final auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: _emailContoller,
            decoration: InputDecoration(
                hintText: "Enter your email",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        SizedBox(height: 40,),
        Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 50),
          decoration: BoxDecoration(
            color:Color(0xFF88B0D7),
            borderRadius: BorderRadius.circular(30),
          ),
          child:Center(
            child:FlatButton(
              onPressed: () async {
                auth.sendPasswordResetEmail(email: _emailContoller.text);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(
                    builder: (context) => LoginPage()),
                );
              },
              child: const Text('Send Request',style:
              TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}