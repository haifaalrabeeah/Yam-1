import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HeartRateChart extends StatefulWidget {




  @override
  _HeartRateChartState createState() => _HeartRateChartState();

}
class _HeartRateChartState extends State<HeartRateChart> {
  final _database = FirebaseDatabase.instance.reference();
  String displaytext = "";
  String min = "";
  String max = "";
  String avg = "";

  activatelistener() {

    _database.child("Wristband").child("HeartRate").onValue.listen((event) {
      final Object? heartrate = event.snapshot.value;
      heartrate.toString();
      setState(() {
        displaytext = '$heartrate';
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
    //  var result= double.parse(displaytext);
    double width = MediaQuery.of(context).size.width;

    return Center(
      child: SingleChildScrollView(
        child: Transform.translate(
            child: Container(
                height: 180,
                width: width * 0.6,
                child: SfRadialGauge(axes: <RadialAxis>[
                  RadialAxis(
                      interval: 10,
                      startAngle: 0,
                      endAngle: 360,
                      showTicks: false,
                      showLabels: false,
                      radiusFactor: 1.3,
                      axisLineStyle: AxisLineStyle(thickness: 10),
                      pointers: <GaugePointer>[
                        RangePointer(
                            value: 50,
                            width: 10,
                            color: Color(0xFF88B0D7),
                            enableAnimation: true,
                            cornerStyle: CornerStyle.bothCurve)
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            widget: Column(
                              children: <Widget>[
                                Container(
                                  width: 50.00,
                                  height: 30.00,
                                ),

                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 10,
                                    ),
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red[900],
                                      size: 60,
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                  child: Container(
                                    child: Text(displaytext,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                  child: Container(
                                    child: Text("BPM",
                                        style: TextStyle(fontSize: 16, color:Colors.blueGrey)),
                                  ),
                                )
                              ],
                            ),
                            angle: 270,
                            positionFactor: 0.1)
                      ])
                ])),
            offset: const Offset(0.0, 30.0)),
      ),
    );
  }
}

