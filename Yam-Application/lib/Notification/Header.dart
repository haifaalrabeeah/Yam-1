import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        bottom: 10,
        left: 30,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Notifications",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );

  }
}