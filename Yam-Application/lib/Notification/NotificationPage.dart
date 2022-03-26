import 'package:flutter/material.dart';
import 'package:yam/Notification//Header.dart';
import 'package:yam/Notification/NotificationContent.dart';
import 'package:yam/Home%20Page/HomePage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:yam/Wristband/WristbandPage.dart';



// import '../footer.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<NotificationPage> {
  @override
  GlobalKey <CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _selectedIndex = 1;
  Widget build(BuildContext context) {
    int _selectedItem = 0;
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
            SizedBox(height: 80,),
            Header(),
            Expanded(child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  )
              ),
              child: NotificationContent(),
            ))
          ],
        ),
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