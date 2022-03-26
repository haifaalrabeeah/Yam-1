import 'package:flutter/material.dart';

import 'Header2.dart';
import 'InputWrapper2.dart';

class SignUpPage extends StatefulWidget {
  @override
  SignUpPageState createState() => SignUpPageState();
}
class SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
       body:  Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color(0xFF88B0D7),
            Color(0xFF2C4E74),
          ]),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 80,),
            Header2(),
            InputWrapper2(),
            Expanded(
                child: Container(
                  height:  double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  )
              ),
            ))
          ],
        ),
      ),
    );
  }
}