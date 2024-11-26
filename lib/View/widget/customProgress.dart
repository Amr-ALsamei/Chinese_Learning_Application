import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CustomProgress extends StatelessWidget {
  const CustomProgress(
      {super.key,
      required this.min,
      required this.max,
      required this.progvalue,
      required this.isActive});
  final double min;
  final double max;
  final int progvalue;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
        minimum: min,
        maximum: max,
        showLabels: false,
        showTicks: false,
        startAngle: 270,
        endAngle: 270,
        axisLineStyle: AxisLineStyle(
          thickness: 1,
          color:
              isActive == true ? Color.fromARGB(255, 0, 169, 181) : Colors.grey,
          thicknessUnit: GaugeSizeUnit.factor,
        ),
        pointers: <GaugePointer>[
          RangePointer(
            value: progvalue.toDouble(),
            width: 0.15,
            color: Colors.white,
            pointerOffset: 0.1,
            cornerStyle: CornerStyle.bothCurve,
            sizeUnit: GaugeSizeUnit.factor,
          )
        ],
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              positionFactor: 0.1,
              angle: 90,
              widget: Text(
                "$progvalue" '%',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ))
        ],
      )
    ]);
  }
}
