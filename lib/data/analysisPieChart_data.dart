import 'package:eco_wise/Core/constants/colours.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:eco_wise/model/pie_chart_model.dart'; // Import the new model

class AnalysisPieChartData {
  // ✅ Define the pie chart data using the model
  final List<PieChartModel> pieChartData = [
    PieChartModel(title: 'Lighting', value: 35.79, color: primaryColor),
    PieChartModel(title: 'Heating', value: 55.10, color: const Color(0xFF26E5FF)),
    PieChartModel(title: 'Charging', value: 6.17, color: const Color(0xFFFFCF26)),
    PieChartModel(title: 'Entertainment', value: 2.95, color: const Color(0xFFEE2727)),
  ];

  
List<PieChartSectionData> getPieChartSections() {
  return pieChartData.map((data) {
    bool isSmall = data.value < 10; // ✅ Detect small sections

    return PieChartSectionData(
      color: data.color,
      value: data.value,
      title: '${data.title}\n${data.value.toStringAsFixed(2)}%', // Show category & percentage
      showTitle: true,
      radius: isSmall ? 70 : 80, // ✅ Smaller radius for small sections
      titleStyle: TextStyle(
        fontSize: isSmall ? 10 : 14, // ✅ Reduce font size for small values
        fontWeight: FontWeight.bold,
        color: data.color == const Color(0xFFFFCF26) ? Colors.white : Colors.white, // Contrast fix
      ),
      titlePositionPercentageOffset: isSmall ? 1.2 : 0.6, // ✅ Move text outward for small slices
    );
  }).toList();
}


  }
