import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  ChartBar({super.key});

  final Map<String, double> categoryData = {
    'Comida': 130.0,
    "Viajes": 500,
    "Negocios": 400.0,
    "Caridades": 200.0,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: DChartBar(
              data: const [
                {
                  'id': 'Bar',
                  'data': [
                    {'Name': 10},
                    {'Another name': 40.0},
                    {'10': 10},
                    {'50': 50}
                  ],
                },
              ],
              domainLabelPaddingToAxisLine: 16,
              axisLineTick: 2,
              axisLinePointWidth: 10,
              axisLineColor: Colors.black,
              measureLabelPaddingToAxisLine: 16,
              barColor: (barData, index, id) => Colors.black,
              showBarValue: true,
            ),
          ),
          SizedBox(
            height: 200,
            child: DChartPie(
                labelColor: Colors.blue,
                data: const [
                  {'domain': 'Flutter', 'measure': 28},
                  {'domain': 'React Native', 'measure': 27},
                  {'domain': 'Ionic', 'measure': 20},
                  {'domain': 'cordova', 'measure': 15},
                ],
                fillColor: (pieData, index) => Colors.black),
          ),
        ],
      ),
    );
  }
}
