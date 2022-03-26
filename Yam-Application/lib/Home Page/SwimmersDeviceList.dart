import 'package:clay_containers/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yam/Wristband/WristbandPage.dart';

class SwimmersDeviceList extends StatefulWidget {
  @override
  _SwimmersDeviceListState createState() => _SwimmersDeviceListState();
}

class _SwimmersDeviceListState extends State<SwimmersDeviceList> {
  User? user = FirebaseAuth.instance.currentUser;
  String wristbandUser = "";

  @override
  Widget build(BuildContext context) {
    // Swimmer's wristband data retrieval
    if(user !=null) {
      FirebaseFirestore.instance
          .collection('Supervisor')
          .doc(user!.uid)
          .snapshots()
          .listen((userData) {
        setState(() {
          wristbandUser = userData.data()!['Swimmers Name'] + ' Wristband';
        });
      });
    }
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
        bottom: 20.0,
      ),
      child: ClayContainer(
        height: 90,
        width: width * 0.90,
        borderRadius: 16,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
            ),
            ListTile(
              leading: ClayContainer(
                width: 40,
                height: 40,
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
                    Icons.watch,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              title: Text(
                wristbandUser,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => WristbandPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

