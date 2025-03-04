import 'package:eco_wise/Validators/validated_hostel_dropdown.dart';
import 'package:eco_wise/data/analysisPieChart_data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalysisPieChart extends StatefulWidget {
  const AnalysisPieChart({super.key});

  @override
  State<AnalysisPieChart> createState() => _AnalysisPieChartState();
}

class _AnalysisPieChartState extends State<AnalysisPieChart> {
  final hostelNameController = TextEditingController();
  AnalysisPieChartData? analysisData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    setState(() => isLoading = true);

    AnalysisPieChartData data = AnalysisPieChartData();
    await data.fetchPieChartData(hostelNameController.text);

    setState(() {
      analysisData = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ValidatedHostelDropdown(
          controller: hostelNameController,
          allowOther: false,
          onChanged: (value) => _fetchData(), // ✅ Update pie chart when hostel changes
        ),
        SizedBox(height: 20),
        isLoading
            ? Center(child: CircularProgressIndicator()) // ✅ Show loader while fetching
            : SizedBox(
                height: 350,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    startDegreeOffset: -90,
                    sections: analysisData!.getPieChartSections(),
                  ),
                ),
              ),
      ],
    );
  }
}
