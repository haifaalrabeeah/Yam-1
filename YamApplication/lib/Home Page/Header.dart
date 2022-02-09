import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yam/Profile/ProfilePage.dart';

class Header extends StatefulWidget {
  HomePage createState() => HomePage();
}

class HomePage extends State<Header> {
  User? user = FirebaseAuth.instance.currentUser;
  String myUsername = "";

  @override
  Widget build(BuildContext context) {
    if(user !=null) {
      FirebaseFirestore.instance
          .collection('Supervisor')
          .doc(user!.uid)
          .snapshots()
          .listen((userData) {
        setState(() {
          myUsername = userData.data()!['Name'];
        });
      });
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Welcome, \n " + myUsername,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 16,
            ),
            height: 60,
            width: 60,
            child: IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

