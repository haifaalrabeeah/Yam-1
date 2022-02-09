import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:yam/Wristband/HeartRateChart.dart';
import 'package:yam/Wristband/HeartRateLineChart.dart';
import 'package:yam/Wristband/WristbandPageContent.dart';

class WristbandPageContent extends StatefulWidget {
  @override
  _WristbandPageContentState createState() => _WristbandPageContentState();
}

class _WristbandPageContentState extends State<WristbandPageContent> {
  int _selectedItem = 0;
  String displaytext = '';
  String MINdisplaytext = '';
  String MAXdisplaytext = '';
  String AVGdisplaytext = '';

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
          print(MINdisplaytext);
        });
      });
    }

    MINdisplaytext.substring(0, 3);
    MAXdisplaytext.substring(0, 3);
    AVGdisplaytext.substring(0, 3);

    /*var result1= double.parse(AVGdisplaytext);
    var result2= double.parse(MINdisplaytext);
    var result3= double.parse(MAXdisplaytext);
    MINdisplaytext.toString();
    MAXdisplaytext.toString();
    AVGdisplaytext.toString();*/

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
                          "Min \n " +MINdisplaytext ,
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "Avg \n  " +AVGdisplaytext,
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),

                        Text(
                          "Max \n " +MAXdisplaytext ,
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

