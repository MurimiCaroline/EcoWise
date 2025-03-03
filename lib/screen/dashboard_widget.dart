import 'package:eco_wise/Util/responsive.dart';
import 'package:eco_wise/Widgets/hostelcard.dart';
import 'package:eco_wise/Widgets/line_chart_card.dart';
import 'package:eco_wise/screen/summary_widget.dart';
import 'package:eco_wise/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:eco_wise/Widgets/consumption_input_form.dart'; // ✅ Import form

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              const SizedBox(height: 18),
              const HeaderWidget(),
              const SizedBox(height: 18),
              const HostelName(),
              const SizedBox(height: 18),
              const LineChartCard(),
              const SizedBox(height: 18),
              if (Responsive.isTablet(context)) const SummaryWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => ConsumptionInputForm(),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue, // ✅ Adjust color if needed
      ),
    );
  }
}
