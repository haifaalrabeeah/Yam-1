import 'package:flutter/material.dart';

import 'Button3.dart';
import 'InputField3.dart';


class InputWrapper3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SizedBox(height: 40,),
          Text("Please provide us with an email to send the reseting instructions.",
            style: TextStyle(color: Colors.black, fontSize: 20,),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            padding: EdgeInsets.only(top: 60),
            child: InputField3(),
          ),

        ],
      ),
    );
  }
}