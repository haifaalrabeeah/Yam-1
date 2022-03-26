import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Header1 extends StatefulWidget{
  ProfilePage1 createState()=> ProfilePage1();
}
class ProfilePage1 extends State<Header1> {
  User? user = FirebaseAuth.instance.currentUser;
  String myUsername="";
  String myUseremail="";

  @override
  Widget build(BuildContext context) {
    if(user !=null) {
      FirebaseFirestore.instance.collection('Supervisor')
          .doc(user!.uid)
          .snapshots()
          .listen((userData) {
        setState(() {
          myUsername = userData.data()!['Name'];
          myUseremail = userData.data()!['Email'];
        });
      });
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              "Profile",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only
              (
              top: 16,
              bottom: 20,
            ),
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:Colors.white,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.person,
                color: Color(0xFF2C4E74),
                size: 100,
              ),
            ),
          ),
      Container(
        margin: const EdgeInsets.only
          (
          bottom: 20,
        ),
          child:Text(
            myUsername,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
         ),

          Container(
            margin: const EdgeInsets.only
              (
              bottom: 20,
            ),
            child:Text(
              myUseremail,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}