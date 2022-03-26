import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yam/Water%20Companies%20List/WaterCompanyList.dart';

class MaintanceTips extends StatefulWidget {
  @override
  _MaintanceTipsState createState() => _MaintanceTipsState();
}

class _MaintanceTipsState extends State<MaintanceTips> {
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
                    "Ways to maintain pool water quality may include:",
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
                    top: 15,
                    bottom: 20,

                  ),
                  child: Text(
                    "1- Checking pH and chlorine levels daily. "
                        "Preferably before the first swim of the day to make"
                        " sure the water quality hasn't altered overnight.",
                    style: TextStyle(
                      color: Color(0xFF2C4E74),
                      fontSize: 15,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16,
                    bottom: 20,

                  ),
                  child: Text(
                    "2- Checking the pH and chlorine twice daily in very hot weather.",
                    style: TextStyle(
                      color: Color(0xFF2C4E74),
                      fontSize: 15,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16,
                    bottom: 20,

                  ),
                  child: Text(
                    "3- Monitoring chlorine levels in heated pools which "
                        "need more chlorine than non-heated pools.",
                    style: TextStyle(
                      color: Color(0xFF2C4E74),
                      fontSize: 15,
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16,
                    bottom: 20,

                  ),
                  child: Text(
                    "4- Brushing and vacuuming your pool on a regular basis.",
                    style: TextStyle(
                      color: Color(0xFF2C4E74),
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16,
                  ),
                  child: Text(
                    "5- Regularly checking the pump, skimmer boxes and other pool equipment, "
                        "and repair or replace parts as necessary.",
                    style: TextStyle(
                      color: Color(0xFF2C4E74),
                      fontSize: 15,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16,
                    top: 50,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ListViewPage()),
                      );
                    }, child: Text("If you need more help, Press Here",
                    style: TextStyle(
                      color: Color(0xFF2C4E74),
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ), ),
                  ),
                ),



              ])),
    );
  }

}

