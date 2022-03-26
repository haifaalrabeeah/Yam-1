import 'package:flutter/material.dart';

import 'Header3.dart';
import 'InputWrapper3.dart';

class ForgetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color(0xFF2C4E74),
            Color(0xFF88B0D7),
          ]),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 80,),
            Header3(),
            Expanded(child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  )
              ),
              child: InputWrapper3(),
            ))
          ],
        ),
      ),
    );
  }
  
}