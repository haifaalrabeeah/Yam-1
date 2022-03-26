import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:yam/Water%20Quality/TempraturePage.dart';
import 'package:yam/Water%20Quality/WaterQualityChartPage.dart';


class WaterQualityContent extends StatefulWidget {
  @override
  _WaterQualityContentState createState() => _WaterQualityContentState();
}

class _WaterQualityContentState extends State<WaterQualityContent> {
  final _database = FirebaseDatabase.instance.reference();
  String displayTemp="0.0";

  activatelistener() {
    _database.child("WaterTemp").child("Temp").onValue.listen((event) {
      final Object? temp = event.snapshot.value;
      temp.toString();
      setState(() {
        displayTemp = '$temp';
      });
    });
  }

  @override
  void initState() {
    super.initState();
    activatelistener();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 180,
      width: width * 1,
      child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16,
                    top: 70,
                  ),
                  child: Text(
                    "Water Temprature",
                    style: TextStyle(
                      color: Color(0xFF2C4E74),
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16,
                    top: 5,
                  ),
                  child: Text(
                    displayTemp+" °C",
                    style: TextStyle(
                      color: Color(0xFF2C4E74),
                      fontSize: 30,
                    ),
                  ),
                ),
                TempraturePage(),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16,
                  ),
                  child: Text(
                    "Water Quality",
                    style: TextStyle(
                      color: Color(0xFF2C4E74),
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                WaterQualityChart(),
              ])),
    );
  }
}
