import 'package:clay_containers/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:store_launcher/store_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yam/Home%20Page/Header.dart';
import 'package:yam/Home%20Page/SwimmersDeviceList.dart';
import 'package:yam/Home%20Page/WaterTempVisualization.dart';
import 'package:yam/Home%20Page/waterQualityVisualization.dart';
import 'package:yam/Profile/ProfilePage.dart';
import 'package:yam/System%20Maintenance/SystemMaintenancePage.dart';
import 'package:yam/Water%20Companies%20List%20Info/WaterCompanyListInfo.dart';
import 'package:yam/Water%20Companies%20List/WaterCompanyList.dart';
import 'package:yam/Water%20Quality/WaterQualityChartPage.dart';
import 'package:yam/Water%20Quality/WaterQualityPage.dart';

class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  int _selectedItem = 0;
  User? user = FirebaseAuth.instance.currentUser;
  String wristbandUser = "";
  String TDS = '0';
  String Temp = '0';
  String pH = '0';

  final _database = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();
    activatelistener();
  }

  activatelistener() {
    _database.child("WaterQuality").child("TDS").onValue.listen((event) {
      final Object? tds = event.snapshot.value;
      tds.toString();
      setState(() {
        TDS = '$tds';
      });
      _database.child("WaterTemp").child("Temp").onValue.listen((event) {
        final Object? temp = event.snapshot.value;
        temp.toString();
        setState(() {
          Temp = '$temp';
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      FirebaseFirestore.instance.collection('Supervisor').doc(user!.uid).snapshots().listen((userData) {
        setState(() {wristbandUser = userData.data()!['Swimmers Name'];
        });
      });
    }
    double width = MediaQuery.of(context).size.width;
    if(TDS != null && Temp !=null) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16,
            top: 70,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20.0,
                  ),
                  child: Text(
                    "Water Measurments",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF2C4E74),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ClayContainer(
                      height: 250,
                      width: width * 0.9,
                      borderRadius: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  bottom: 16,
                                  top: 10,
                                ),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      Text(
                                        "Quality",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF2C4E74),
                                        ),
                                      ),
                                      Text(
                                        TDS,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xFF2C4E74),
                                        ),
                                      ),
                                      WaterQualityVisualization(),

                                    ]),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  bottom: 16,
                                  top: 10,
                                ),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      Text(
                                        "Temp",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF2C4E74),
                                        ),
                                      ),
                                      Text(
                                        Temp,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xFF2C4E74),
                                        ),
                                      ),
                                      WaterTempVisualization(),

                                    ]

                                  /*barChart
                              (
                              title: '',
                            ),*/
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 16.0,
                                bottom: 10,
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xFF2C4E74),
                                  size: 25,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WaterQuality()),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  /* ClayContainer(

                    height: 180,
                    width: width * 0.40,
                    borderRadius: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 16,
                            top: 16,
                            bottom: 16,
                          ),
                          child: Text(
                            "Water Temprature",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF2C4E74),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 35,
                          ),
                          child: Text(
                            "37°C",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 16.0,
                              bottom: 10,
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Color(0xFF2C4E74),
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),*/
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                    bottom: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Services",
                        style: TextStyle(
                          color: Color(0xFF2C4E74),
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ClayContainer(
                          height: 160,
                          width: width * 0.40,
                          borderRadius: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: SizedBox(
                                  height: 110,
                                  width: 150,
                                  child: IconButton(
                                    padding: const EdgeInsets.only(
                                      top: 30,
                                    ),
                                    icon: Icon(
                                      Icons.phone,
                                      color: Color(0xFF2C4E74),
                                      size: 70,
                                    ),
                                    onPressed: () =>
                                        launch("tel:+966540222067"),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  child: Text(
                                    "Emergency Request",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF2C4E74),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ClayContainer(
                          height: 160,
                          width: width * 0.40,
                          borderRadius: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: SizedBox(
                                  height: 110,
                                  width: 150,
                                  child: IconButton(
                                    padding: const EdgeInsets.only(
                                      top: 30,
                                    ),
                                    icon: Icon(
                                      Icons.power_settings_new,
                                      color: Color(0xFF2C4E74),
                                      size: 70,
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfilePage()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  child: Text(
                                    "System Power",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF2C4E74),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ClayContainer(
                          height: 160,
                          width: width * 0.40,
                          borderRadius: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: SizedBox(
                                  height: 110,
                                  width: 150,
                                  child: IconButton(
                                    padding: const EdgeInsets.only(
                                      top: 30,
                                    ),
                                    icon: Icon(
                                      Icons.handyman_rounded,
                                      color: Color(0xFF2C4E74),
                                      size: 70,
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SystemMaintenancePage()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  child: Text(
                                    "System Maintenance",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF2C4E74),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ClayContainer(
                          height: 160,
                          width: width * 0.40,
                          borderRadius: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: SizedBox(
                                  height: 110,
                                  width: 150,
                                  child: IconButton(
                                    padding: const EdgeInsets.only(
                                      top: 30,
                                    ),
                                    icon: Icon(
                                      Icons.water_damage,
                                      color: Color(0xFF2C4E74),
                                      size: 70,
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ListViewPageInfo()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  child: Text(
                                    "Water Maintenance",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF2C4E74),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /* ClayContainer(
                        height: 160,
                        width: width * 0.40,
                        borderRadius: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: SizedBox(
                                height: 110,
                                width: 150,
                                child: IconButton(
                                  padding: const EdgeInsets.only(
                                    top: 30,
                                  ),
                                  icon: Icon(
                                    Icons.watch,
                                    color: Color(0xFF2C4E74),
                                    size: 70,
                                  ),
                                  onPressed: ()  => openWithStore(),


                                ),
                              ),
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 20,
                                ),
                                child: Text(
                                  "Pair Fitbit Device",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF2C4E74),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),*/
                      ],
                    ),
                  ],
                ),
                //Device
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "My Device",
                        style: TextStyle(
                          color: Color(0xFF2C4E74),
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SwimmersDeviceList(),
              ],
            ),
          ),
        ),
      );
    }
    else {
      return Center(
        child: Text(
          'ERROR',

        ),
      );
    }
  }
}

Future<void> openWithStore() async {
  var appId = '462638897';
  print('app id: $appId');
  try {
    StoreLauncher.openWithStore(appId).catchError((e) {
      print('ERROR> $e');
    });
  } on Exception catch (e) {
    print('$e');
  }

  StoreLauncher.openWithStore(appId);
}
