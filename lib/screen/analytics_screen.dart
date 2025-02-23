import 'package:eco_wise/Widgets/analysis_pie_chart.dart';
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Power Consumption Analysis"
        ),
      ),
    body: AnalysisPieChart(),
    );
  }
}






