import 'package:clay_containers/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yam/About%20us/AboutUs.dart';
import 'package:yam/Home%20Page/HomePage.dart';
import 'package:yam/Home%20Page/HomePageContent.dart';
import 'package:yam/Login/LoginPage.dart';

class ProfilePageContent extends StatefulWidget {
  @override
  _ProfilePageContentState createState() => _ProfilePageContentState();

}

class _ProfilePageContentState extends State<ProfilePageContent> {


  Widget textfield({@required hintText}) {
    return Material(
      color:Colors.white,
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
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
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical:50),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey)
                ),
              ),

              child: TextButton(onPressed: () => openWithStore(),
                child:Row(
                    mainAxisAlignment: MainAxisAlignment.start,


                    children: [
                      Icon(Icons.info,color: Color(0xFF88B0D7),),


                      Text(
                          "  Pair Fitbit Device",
                          style: TextStyle(color: Colors.black, fontSize: 18,)

                      ),
                    ]
                ),

              ),
            ),

            Container(
            alignment: Alignment.centerLeft,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey)
                    ),
                  ),

                 child: TextButton(onPressed: () {
                    Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => AboutUs()),
                    );
                  },
                   child:Row(
                       mainAxisAlignment: MainAxisAlignment.start,


                       children: [
                         Icon(Icons.info,color: Color(0xFF88B0D7),),


                         Text(
                      "  About us",
                        style: TextStyle(color: Colors.black, fontSize: 18,)

                    ),
                       ]
                   ),

                ),
                ),


            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical:50),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey)
                ),
              ),

              child: TextButton(onPressed: () {
                Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
                child:Row(
                    mainAxisAlignment: MainAxisAlignment.start,


                    children: [
                      Icon(Icons.check,color: Color(0xFF88B0D7),),


                      Text(
                          "  Terms and Condition",
                          style: TextStyle(color: Colors.black, fontSize: 18,)

                      ),
                    ]
                ),

              ),
            ),
        /*Container(
          height: 20,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.grey)
            ),
          ),
          child:Align(
                alignment: Alignment.centerLeft,
                  child:Text(
                    "Email: "+myUseremail,
                    style: const TextStyle(color: Colors.black,),
                  ),
              ),
        ),*/

            Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 60),
              decoration: BoxDecoration(
                color:Color(0xFF88B0D7),
                borderRadius: BorderRadius.circular(30),
              ),
              child:Center(
                child:Align(
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(
                    onPressed: () async {

                      await FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }, child:  Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}