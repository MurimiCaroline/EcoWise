import 'package:eco_wise/Core/constants/colours.dart';
import 'package:eco_wise/Services/analysis_pie_chart_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:eco_wise/model/pie_chart_model.dart';

class AnalysisPieChartData {
  List<PieChartModel> pieChartData = [];

  Future<void> fetchPieChartData(String selectedHostel) async {
    Map<String, double> data = await AnalysisPieChartDatabase().fetchPieChartData(selectedHostel);

    if (data.isEmpty) {
      print("⚠️ No data received from Firebase.");
      return;
    }

    pieChartData = [
      PieChartModel(title: 'Lighting', value: data["Lighting"] ?? 0, color: primaryColor),
      PieChartModel(title: 'Heating', value: data["Heating"] ?? 0, color: const Color(0xFF26E5FF)),
      PieChartModel(title: 'Charging', value: data["Charging"] ?? 0, color: const Color(0xFFFFCF26)),
      PieChartModel(title: 'Entertainment', value: data["Entertainment"] ?? 0, color: const Color(0xFFEE2727)),
    ];
  }

  List<PieChartSectionData> getPieChartSections() {
    return pieChartData.map((data) {
      bool isSmall = data.value < 10;

      return PieChartSectionData(
        color: data.color,
        value: data.value,
        title: '${data.title}\n${data.value.toStringAsFixed(2)}%',
        showTitle: true,
        radius: isSmall ? 70 : 80,
        titleStyle: TextStyle(
          fontSize: isSmall ? 10 : 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titlePositionPercentageOffset: isSmall ? 1.2 : 0.6,
      );
    }).toList();
  }
}
