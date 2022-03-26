import 'package:flutter/material.dart';

class Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            Text("Login",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white, fontSize: 40,fontWeight: FontWeight.bold,),
            ),

          SizedBox(height: 20,),

        ],
      ),
    );
  }
}