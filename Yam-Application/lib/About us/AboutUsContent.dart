import 'package:flutter/material.dart';
import 'package:yam/Profile/ProfilePage.dart';

final data = [55.0, 90.0, 50.0, 40.0, 35.0, 55.0, 70.0, 100.0];

class AboutUsContent extends StatefulWidget {
  @override
  _AboutUsContentState createState() => _AboutUsContentState();
}

class _AboutUsContentState extends State<AboutUsContent> {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
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
                    "logyvfdsretder",
                    style: TextStyle(
                      color: Color(0xFF2C4E74),
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    radius: 200.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/yamLogo2.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Color(0xFF2C4E74),
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                  ),
                ),
              ])),
    );
  }
}