import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcGaugeRange extends GaugeRange {
  ImcGaugeRange({
    required double startValue,
    required double endValue,
    required Color color,
    required String label,
  }) : super(
          startValue: startValue,
          endValue: endValue,
          color: color,
          label: label,
          sizeUnit: GaugeSizeUnit.factor,
          labelStyle: GaugeTextStyle(fontSize: 12, fontFamily: 'Times'),
          startWidth: 0.65,
          endWidth: 0.65,
        );
}
