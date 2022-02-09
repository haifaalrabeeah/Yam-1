import 'package:flutter/material.dart';

class Button3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color:Color(0xFF88B0D7),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text("Forget Password",style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),),
      ),
    );

  }
}