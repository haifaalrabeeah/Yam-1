import 'dart:math';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yam/Wristband/HeartRateChart.dart';


class WristbandPageContent extends StatefulWidget {
  @override
  _WristbandPageContentState createState() => _WristbandPageContentState();
}

class _WristbandPageContentState extends State<WristbandPageContent> {
  String displaytext = '0.0';
  String MINdisplaytext = '0.0';
  String MAXdisplaytext = '0.0';
  String AVGdisplaytext = '0.0';

  User? user = FirebaseAuth.instance.currentUser;
  String myUsername = "";
  String myUserage = "";

  CollectionReference users = FirebaseFirestore.instance.collection("Supervisor");


  final _database = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();
    activatelistener();
  }

  activatelistener() {
    _database.child("Wristband").child("HeartRate").onValue.listen((event) {
      final Object? heartrate = event.snapshot.value;
      heartrate.toString();
      setState(() {
        displaytext = '$heartrate';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(user !=null) {
      FirebaseFirestore.instance.collection('HeartRate').doc("HeartRateAnalysis").snapshots().listen((userData) {
        setState(() {
          MINdisplaytext = userData.data()!['Min'];
          MAXdisplaytext = userData.data()!['Max'];
          AVGdisplaytext = userData.data()!['Avg'];
        });
      });
    }

    int decimals = 2;
    num fac = pow(10, decimals);

    var result1= double.parse(AVGdisplaytext);
    result1 = (result1 * fac).round() / fac;
    var avg= result1.toString();

    var result2= double.parse(MINdisplaytext);
    result2 = (result2 * fac).round() / fac;
    var min= result2.toString();

    var result3= double.parse(MAXdisplaytext);
    result3 = (result3 * fac).round() / fac;
    var max= result3.toString();


    double width = MediaQuery.of(context).size.width;
    if(user !=null) {
      FirebaseFirestore.instance.collection('Supervisor').doc(user!.uid).snapshots().listen((userData) {
        setState(() {
          myUsername = userData.data()!['Swimmers Name'];
          myUserage = userData.data()!['Age'];
        });
      });
    }

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
              top: 5.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16,
                      top: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Swimmer's Information",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      ListTile(
                        leading: ClayContainer(
                          width: 40,
                          height: 50,
                          borderRadius: 8,
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFF2C4E74),
                                    Color(0xFF88B0D7),
                                  ]).createShader(bounds);
                            },
                            blendMode: BlendMode.srcATop,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                        title: Text(
                          myUsername,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        subtitle: Text(
                          myUserage+ " years old",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                  HeartRateChart(),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16,
                      top: 120,
                      bottom:20.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Min \n " + min ,
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "Avg \n  " + avg,
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),

                        Text(
                          "Max \n " + max ,
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


