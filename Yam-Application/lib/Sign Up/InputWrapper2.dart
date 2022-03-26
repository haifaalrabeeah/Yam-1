import 'package:flutter/material.dart';
import 'InputField2.dart';
import '../Login/LoginPage.dart';


class InputWrapper2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
            ),

            child: InputField2(),

          ),
          SizedBox(height: 40,),
          //Button2(),
          Container(

            padding: EdgeInsets.only(bottom: 20),
          ),
          TextButton(onPressed: () {
            Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );

          },
            child:Text(
              "Already have account?",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}