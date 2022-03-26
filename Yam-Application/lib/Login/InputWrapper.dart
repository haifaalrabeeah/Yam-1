import 'package:flutter/material.dart';
import 'package:yam/Forget%20Password/ForgetPasswordPage.dart';
import 'package:yam/Sign%20Up/SignUpPage.dart';
import 'InputField.dart';


class InputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          SizedBox(height: 40,),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            padding: EdgeInsets.only(bottom: 20),
            child: InputField(),
          ),

          //Button(),
          Container(

            padding: EdgeInsets.only(bottom: 20),
          ),
          TextButton(onPressed: () {
            Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => ForgetPasswordPage()),
            );
          },
            child: Text(
              "Forgot Password?",
              style: TextStyle(color: Colors.grey),
            ),
          ),


          Container(

            padding: EdgeInsets.only(bottom: 50),
          ),

          TextButton(onPressed: () {
            Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => SignUpPage()),
            );
          },
            child: Text(
              "New Account?",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}