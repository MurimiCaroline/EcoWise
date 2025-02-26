
import 'package:eco_wise/Util/responsive.dart';
import 'package:eco_wise/Widgets/bar_graph_widget.dart';
import 'package:eco_wise/Widgets/hostelcard.dart';
import 'package:eco_wise/screen/summary_widget.dart';
import 'package:eco_wise/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 18),
            const HeaderWidget(),
            const SizedBox(height: 18),
            const HostelName(),
            // const ActivityDetailsCard(),
            const SizedBox(height: 18),
            // const LineChartCard(),
            const SizedBox(height: 18),
            const BarGraphCard(),
            const SizedBox(height: 18),
            if (Responsive.isTablet(context)) const SummaryWidget(),
          ],
        ),
      ),
    );
  }
}