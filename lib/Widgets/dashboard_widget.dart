import 'package:eco_wise/Util/responsive.dart';
import 'package:eco_wise/Widgets/bar_graph_widget.dart';
import 'package:eco_wise/Widgets/summary_widget.dart';
import 'package:eco_wise/widgets/activity_details_card.dart';
import 'package:eco_wise/widgets/header_widget.dart';
import 'package:eco_wise/widgets/line_chart_card.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            SizedBox(height:18),
              HeaderWidget(),
              SizedBox(height: 18),
              ActivityDetailsCard(),
              SizedBox(height: 18,),
              LineChartCard(),
              SizedBox(height: 18,),
              BarGraphCard(),
              SizedBox(height: 18,),
              if(Responsive.isTablet(context)) SummaryWidget()
      
                  ],
        ),
      ),
    );
  }
}