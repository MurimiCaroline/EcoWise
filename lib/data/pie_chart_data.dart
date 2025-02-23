

import 'package:eco_wise/Core/constants/colours.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartData {
  final paiChartSelectionDatas = [
    PieChartSectionData(
      color: primaryColor,
      value: 7.84,
      showTitle: false,
      radius: 25,
    ),
    PieChartSectionData(
      color: const Color(0xFF26E5FF),
      value: 61.8,
      showTitle: false,
      radius: 22,
    ),
    PieChartSectionData(
      color: const Color(0xFFFFCF26),
      value: 27,
      showTitle: false,
      radius: 19,
    ),
    PieChartSectionData(
      color: const Color(0xFFEE2727),
      value: 3.5,
      showTitle: false,
      radius: 16,
    ),
    // PieChartSectionData(
    //   color: primaryColor.withOpacity(0.1),
    //   value: 25,
    //   showTitle: false,
    //   radius: 13,
    // ),
  ];
}
