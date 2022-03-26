import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class WaterTempVisualization extends StatefulWidget {
  @override
  _WaterTempVisualizationState createState() => _WaterTempVisualizationState();
}

class _WaterTempVisualizationState extends State<WaterTempVisualization> {
  final _database = FirebaseDatabase.instance.reference();
  String displaytext="0";
// Listen to real time data
  activatelistener() {
    _database.child("WaterTemp").child("Temp").onValue.listen((event) {
      final Object? temp = event.snapshot.value;
      temp.toString();
      setState(() {
        displaytext = '$temp';
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
    var result= double.parse(displaytext);
    double width = MediaQuery.of(context).size.width;
    // Visualize the water temperature chart
    return Center(
      child: Transform.translate(
          child: Container(
            height: 110,
            width: width * 0.4,
            child: SfLinearGauge(
              minorTicksPerInterval: 4,
              useRangeColorForAxis: true,
              animateAxis: true,
              axisTrackStyle: LinearAxisTrackStyle(thickness: 1),
              orientation: LinearGaugeOrientation.vertical,
              ranges: <LinearGaugeRange>[
                //First range.
                LinearGaugeRange(
                    startValue: 0, endValue: 50, color: Colors.blueGrey),
                //Second range.
                LinearGaugeRange(
                    startValue: 50, endValue: 70, color:Color(0xFF88B0D7)),
                //Third range.
                LinearGaugeRange(
                    startValue: 70, endValue: 100, color:Color(0xFF2C4E74))

              ],
              barPointers: [
                LinearBarPointer(
                  value: result,
                  color: Colors.grey,
                  // Changed the thickness to make the curve visible
                  //Updated the edge style as curve at end position
                  edgeStyle: LinearEdgeStyle.endCurve,
                  position: LinearElementPosition.outside,
                  offset: 5,
                )
              ],
            ),
          ),
          offset: const Offset(0.0, 30.0)
      ),
    );
  }
}