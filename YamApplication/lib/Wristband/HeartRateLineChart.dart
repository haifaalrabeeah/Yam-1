import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HeartRateLineChart extends StatefulWidget {
  @override
  _HeartRateLineChartState createState() => _HeartRateLineChartState();
}

class _HeartRateLineChartState extends State<HeartRateLineChart> {
  final _database = FirebaseDatabase.instance.reference();
  String displaytext = "";
  String min = "";
  String max = "";
  String avg = "";
  List<double> myList = <double>[];

  activatelistener() {
    _database.child("Wristband").child("HeartRate").onValue.listen((event) {
      final Object? heartrate = event.snapshot.value;
      heartrate.toString();
      setState(() {
        displaytext = '$heartrate';
        var result= double.parse(displaytext);
    //    myList.add(result);
    //    print(myList);
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
                child: SfSparkLineChart(
                  axisLineWidth: 0,
                  trackball: SparkChartTrackball(
                      backgroundColor: Colors.red.withOpacity(0.8),
                      borderColor: Colors.red.withOpacity(0.8),
                      borderWidth: 2,
                      color: Colors.red,
                      labelStyle: TextStyle(color: Colors.black),
                      activationMode: SparkChartActivationMode.tap
                  ),
                  marker: SparkChartMarker(
                      displayMode: SparkChartMarkerDisplayMode.all),
                  data: myList,
                )
      ),
        offset: const Offset(0.0, 30.0)
    ),
      ),

    );
  }
}

