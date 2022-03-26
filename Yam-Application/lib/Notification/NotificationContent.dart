import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';

class NotificationContent extends StatefulWidget {
  @override
  _NotificationPageContentState createState() => _NotificationPageContentState();
}

class _NotificationPageContentState extends State<NotificationContent> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16,
            top: 60,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                ClayContainer(
                  color: Colors.white,
                  height: 90,
                  width: width * 0.90,
                  borderRadius: 10,
                  child: Column(

                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only
                            (
                            top: 1,
                            bottom: 10,
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.notifications),
                          title: Text(
                            "Low Water Quality",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          subtitle: new Text("Need Some Maintenance"),
                        ),

                      ],
                    ),

                ),

                Padding(
                  padding: const EdgeInsets.only
                    (
                    bottom: 15,
                  ),
                ),

                ClayContainer(
                  color: Colors.white,
                  height: 90,
                  width: width * 0.90,
                  borderRadius: 10,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only
                          (
                          top: 1,
                          bottom: 10,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.notifications),
                        title: Text(
                          "High Ph Level",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        subtitle: new Text("Need Some Maintenance"),
                      ),
                    ],
                  ),
                ),

                Padding (
                  padding: const EdgeInsets.only
                    (
                    bottom: 10,
                  ),
                ),

                ClayContainer(
                  color: Colors.white,
                  height: 90,
                  width: width * 0.90,
                  borderRadius: 1,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only
                          (
                          top: 1,
                          bottom: 10,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.notifications),
                        title: Text(
                          "Low Water Quality",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        subtitle: new Text("Need Some Maintenance"),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only
                    (
                    bottom: 15,
                  ),
                ),

                ClayContainer(
                  color: Colors.white,
                  height: 90,
                  width: width * 0.90,
                  borderRadius: 10,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only
                          (
                          top: 1,
                          bottom: 10,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.notifications),
                        title: Text(
                          "High Ph Level",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        subtitle: new Text("Need Some Maintenance"),
                      ),
                    ],
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}