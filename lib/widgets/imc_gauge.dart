import 'package:cto_counter_bloc/widgets/imc_gauge_range.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcGauge extends StatelessWidget {
  final double imc;

  const ImcGauge({super.key, required this.imc});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 12.5,
          maximum: 47.9,
          showLabels: false,
          showAxisLine: false,
          showTicks: false,
          ranges: <GaugeRange>[
            ImcGaugeRange(
              startValue: 12.5,
              endValue: 18.5,
              color: Colors.blue,
              label: 'Magreza',
            ),
            ImcGaugeRange(
              startValue: 18.5,
              endValue: 24.5,
              color: Colors.green,
              label: 'Peso normal',
            ),
            ImcGaugeRange(
              startValue: 24.5,
              endValue: 29.9,
              color: Colors.yellow[600]!,
              label: 'Sobrepeso',
            ),
            ImcGaugeRange(
              startValue: 29.9,
              endValue: 39.9,
              color: Colors.red[900]!,
              label: 'Obesidade',
            ),
          ],
          pointers: <GaugePointer>[
            NeedlePointer(
              value: imc,
              enableAnimation: true,
              animationDuration: 1000,
            ),
          ],
        ),
      ],
    );
  }
}
