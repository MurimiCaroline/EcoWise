import 'package:eco_wise/data/analysisPieChart_data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalysisPieChart extends StatefulWidget {
  const AnalysisPieChart({super.key});

  @override
  State<AnalysisPieChart> createState() => _AnalysisPieChartState();
}

class _AnalysisPieChartState extends State<AnalysisPieChart> {
  @override
  Widget build(BuildContext context) {
    final analysisPieChartData = AnalysisPieChartData(); // ✅ Create an instance
    return Column(
      children: [
        const Text('Hostel A Usage Analysis'),
        SizedBox(
          height: 350,
          child: PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              startDegreeOffset: -90,
              sections: analysisPieChartData.getPieChartSections(), // ✅ Uses the new model
            ),
          ),
        ),
      ],
    );
  }
}
