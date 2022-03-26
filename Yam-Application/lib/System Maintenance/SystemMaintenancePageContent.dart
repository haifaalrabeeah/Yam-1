import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';


class SystemMaintenancePageContent extends StatefulWidget {
  @override
  _SystemMaintenancePageContentState createState() =>
      _SystemMaintenancePageContentState();
}

class _SystemMaintenancePageContentState extends State<SystemMaintenancePageContent> {
  User? user = FirebaseAuth.instance.currentUser;


    @override
    Widget build(BuildContext context) {
      double width = MediaQuery
          .of(context)
          .size
          .width;

      return Container(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16,
                top: 20.0,
              ),
              child: ListTile(
                title: Text(
                  'Facing issues?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF2C4E74),
                  ),
                ),
                subtitle: Text(
                  'Don’t hesitate to contact us if you are facing issues.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF2C4E74),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16,
                top: 10.0,
              ),
              child: Text(
                "Yam Support",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF2C4E74),
                ),
              ),),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16,
                top: 10.0,
              ),

              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  child: TextButton(
                    onPressed: () => launch("tel:+966540222067"),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.phone,
                            color: Color(0xFF88B0D7),
                          ),
                          Text("  Phone Number : 05xxxxxxxx3",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                        ]),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16,
                top: 10.0,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  child: TextButton(
                    onPressed: () => launch('mailto:alrabeeah.h@gmail.com'),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.mail,
                            color: Color(0xFF88B0D7),
                          ),
                          Text("  Email : yam@yamm.com",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                        ]),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16,
                top: 10.0,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  child: TextButton(
                    onPressed: () => launch('https://www.google.com/maps/dir/?api=1&origin=43.7967876,-79.5331616&destination=43.5184049,-79.8473993&waypoints=43.1941283,-79.59179|43.7991083,-79.5339667|43.8387033,-79.3453417|43.836424,-79.3024487&travelmode=driving&dir_action=navigate'),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.map,
                            color: Color(0xFF88B0D7),
                          ),
                          Text("  Location : Riyadh, KSA",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                        ]),
                  ),
                ),
              ]),
            ),

          ]),
        ),
      );
    }
  }

// This is a block of Model Dialog
  showDialogFunc(context, img, title, desc) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              height: 320,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      img,
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // width: 200,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        desc,
                        maxLines: 3,
                        style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
