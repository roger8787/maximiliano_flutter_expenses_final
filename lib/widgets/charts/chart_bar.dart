import 'package:d_chart/d_chart.dart';
import 'package:fl_chart/fl_chart.dart';
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
      height: 400,
      child: Column(
        children: [
          // SizedBox(
          //   height: 200,
          //   child: DChartBar(
          //     data: [
          //       {
          //         'id': 'Bar',
          //         'data': [
          //           {'domain': 'Food', 'measure': 156.0},
          //           {'domain': 'Leaisure', 'measure': 134.5},
          //           {'domain': 'Travel', 'measure': 45.6},
          //           {'domain': 'gifts', 'measure': 56.7},
          //         ],
          //       },
          //     ],
          //     domainLabelPaddingToAxisLine: 16,
          //     axisLineTick: 2,
          //     axisLinePointTick: 2,
          //     axisLinePointWidth: 10,
          //     axisLineColor: Colors.green,
          //     measureLabelPaddingToAxisLine: 16,
          //     barColor: (barData, index, id) => Colors.green,
          //     showBarValue: true,
          //   ),
          // ),

          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                  gridData: FlGridData(
                    show: true,
                    checkToShowVerticalLine: (value) => value % 5 == 0,
                    getDrawingVerticalLine: (value) => FlLine(
                      color: Colors.grey,
                      strokeWidth: 0.5,
                    ),
                  ),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(
                        toY: 8,
                        color: Colors.blue,
                      )
                    ]),
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(
                        toY: 12,
                        color: Colors.blue,
                      )
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(
                        toY: 14,
                        color: Colors.blue,
                      )
                    ]),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(
                        toY: 13,
                        color: Colors.green,
                      )
                    ])
                  ],
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 20,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(),
                    ),
                  )),
              swapAnimationDuration: const Duration(milliseconds: 150),
              swapAnimationCurve: Curves.linear,
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
