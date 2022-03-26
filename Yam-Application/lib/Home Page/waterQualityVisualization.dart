import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:firebase_database/firebase_database.dart';


class WaterQualityVisualization extends StatefulWidget {
  @override
  _WaterQualityVisualizationState createState() => _WaterQualityVisualizationState();
}

class _WaterQualityVisualizationState extends State<WaterQualityVisualization> {

  String TDS='0';
  String Temo='0';
  String pH='0';

  final _database = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();
    activatelistener();
  }
// Listen for any real time data
  activatelistener() {
    _database.child("WaterQuality").child("TDS").onValue.listen((event) {
      final Object? tds = event.snapshot.value;
      tds.toString();
      setState(() {
        TDS = '$tds';
      });
    });

  }


  @override
  Widget build(BuildContext context) {
    var result= double.parse(TDS);

    double width = MediaQuery.of(context).size.width;
    // Visualize Water quality charts
    return Container(
      child: Transform.translate(
          child: Container(
              height: 120,
              width: width * 0.4,
              child: SfRadialGauge(
                axes:<RadialAxis>[
                  RadialAxis(showLabels: false, showAxisLine: false, showTicks: false,
                      minimum: 0, maximum: 2000,
                      ranges: <GaugeRange>[GaugeRange(startValue: 0, endValue: 600,
                          color: Colors.blueGrey, label: 'Low',
                          sizeUnit: GaugeSizeUnit.factor,
                          labelStyle: GaugeTextStyle( fontSize:  12,color: Colors.white),
                          startWidth: 0.3, endWidth: 0.3
                      ), GaugeRange(startValue: 600, endValue: 1300,
                        color:Color(0xFF88B0D7), label: 'Moderate',
                        labelStyle: GaugeTextStyle( fontSize:   12, color: Colors.white),
                        startWidth: 0.3, endWidth: 0.3, sizeUnit: GaugeSizeUnit.factor,
                      ),
                        GaugeRange(startValue: 1300, endValue: 2000,
                          color:Color(0xFF2C4E74), label: 'Good',
                          labelStyle: GaugeTextStyle( fontSize:   12,color: Colors.white),
                          sizeUnit: GaugeSizeUnit.factor,
                          startWidth: 0.3, endWidth: 0.3,
                        ),

                      ],
                      pointers: <GaugePointer>[NeedlePointer(value: result,
                      )]
                  )
                ],
              )
          ),
          offset: const Offset(0.0, 30.0)
      ),
    );
  }
}