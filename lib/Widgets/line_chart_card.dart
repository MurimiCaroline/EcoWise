import 'package:eco_wise/Core/constants/colours.dart';
import 'package:eco_wise/Widgets/custom_card_widget.dart';
import 'package:eco_wise/data/line_chart_data.dart';
import 'package:eco_wise/Widgets/week_selection_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartCard extends StatefulWidget {
  const LineChartCard({super.key});

  @override
  _LineChartCardState createState() => _LineChartCardState();
}

class _LineChartCardState extends State<LineChartCard> {
  LineData data = LineData();
  bool isLoading = true;
  String selectedWeek = "";

  @override
  void initState() {
    super.initState();
    _loadChartData();
  }

  void _loadChartData() async {
    if (selectedWeek.isNotEmpty) {
      setState(() => isLoading = true);
      await data.fetchDataForWeek(selectedWeek);
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Energy Overview", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 10),

          // ✅ Week Selection Dropdown
          WeekSelectionDropdown(
            onWeekSelected: (week) {
              setState(() {
                selectedWeek = week;
                _loadChartData();
              });
            },
          ),

          const SizedBox(height: 20),

          AspectRatio(
            aspectRatio: 16 / 6,
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : LineChart(
                    LineChartData(
                      lineTouchData: LineTouchData(handleBuiltInTouches: true),
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
  sideTitles: SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      print("📅 X-Axis Label: ${data.bottomTitle[value.toInt()]}"); // ✅ Debugging
      return data.bottomTitle[value.toInt()] != null
          ? Text(data.bottomTitle[value.toInt()] ?? "")
          : SizedBox();
    },
  ),
),

                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 20, // ✅ Proper Y-Axis Scale
                            reservedSize: 40,
                            getTitlesWidget: (value, meta) {
                              return Text("${value.toInt()}kW");
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          color: selectionColor,
                          barWidth: 2.5,
                          belowBarData: BarAreaData(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [selectionColor.withAlpha(125), Colors.transparent],
                            ),
                            show: true,
                          ),
                          dotData: FlDotData(show: false),
                          spots: data.spots,
                        )
                      ],
                      minX: 0,
                      maxX: 6, // ✅ Displaying a week's data
                      // maxY: 300,
                      // minY: 220,
                      minY: data.spots.isNotEmpty 
    ? data.spots.map((e) => e.y).reduce((a, b) => a < b ? a : b) - 10000  // ✅ Adjusts scaling
    : 220, 
maxY: data.spots.isNotEmpty 
    ? data.spots.map((e) => e.y).reduce((a, b) => a > b ? a : b) + 10000  // ✅ Adds buffer
    : 300,

                      
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
