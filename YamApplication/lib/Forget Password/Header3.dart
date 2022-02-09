import 'package:flutter/material.dart';

class Header3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Text("Forget Password",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold,),
          ),

          SizedBox(height: 10,),

        ],
      ),
    );
  }
}