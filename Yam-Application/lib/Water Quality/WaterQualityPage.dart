import 'package:flutter/material.dart';
import 'package:yam/Home%20Page/HomePage.dart';
import 'package:yam/Profile/Header.dart';
import 'package:yam/Profile/ProfilePage.dart';
import 'package:yam/Water%20Quality/Header.dart';
import 'package:yam/Water%20Quality/WaterQualityPageContent.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:yam/Wristband/WristbandPage.dart';


class WaterQuality extends StatefulWidget {
  @override
  _WaterQualityState createState() => _WaterQualityState();
}

class _WaterQualityState extends State<WaterQuality> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color(0xFF2C4E74),
            Color(0xFF88B0D7),
          ]),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Header(),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      )),
                  child: WaterQualityContent(),
                ))
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _selectedIndex,
        height: 67.0,
        items: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.0),

            ),
            child: Icon(
              Icons.home,
              size: (_selectedIndex == 0 ? 30 : 25),
              color: (_selectedIndex == 0 ? Colors.white : Colors.grey),
            ),
          ),
          Icon(
            Icons.watch,
            size: (_selectedIndex == 1 ? 30 : 25),
            color: (_selectedIndex == 1 ? Colors.white : Colors.grey),
          ),
          Icon(
            Icons.stacked_bar_chart,
            size: (_selectedIndex == 2 ? 30 : 25),
            color: (_selectedIndex == 2 ? Colors.white : Colors.grey),
          ),
          Icon(
            Icons.person,
            size: (_selectedIndex == 3 ? 30 : 25),
            color: (_selectedIndex == 3 ? Colors.white : Colors.grey),
          ),
        ],
        color: Colors.grey.shade100,
        buttonBackgroundColor: Color(0xFF88B0D7),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        // animationCurve: Curves.decelerate,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) {
            Navigator.pushReplacement(
                this.context,
                MaterialPageRoute(
                    builder: (context,) =>
                        HomePage()));
          } else if (index == 1) {
            Navigator.pushReplacement(
                this.context,
                MaterialPageRoute(
                    builder: (context,) =>
                        WristbandPage()));
          } else if (index == 3) {
            Navigator.pushReplacement(
                this.context,
                MaterialPageRoute(
                    builder: (context,) =>
                        ProfilePage()));
          } else if (index == 2) {
            return;
          }
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}


class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xFF2C4E74);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
