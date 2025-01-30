
import 'package:eco_wise/Util/responsive.dart';
import 'package:eco_wise/Widgets/summary_widget.dart';
import 'package:eco_wise/widgets/dashboard_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/side_menu_widgets.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    
    return Scaffold(
      drawer: !isDesktop ? SizedBox(
      width: 250,
      child: SideMenuWidget(),
      ) : null,
      //       appBar: AppBar(
      //   title: Text('Dashboard UI'),
      // ),
      endDrawer: Responsive.isMobile(context) ? 
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: SummaryWidget(),
      ) : null,
      body: SafeArea(
        child: Row(
          children: [
            if(isDesktop)
            Expanded(
              flex: 2,
              child:SizedBox(
                child: SideMenuWidget(),
              ),
              ),
              Expanded(
              flex: 7,
              child: DashboardWidget(
               
              ),
              ),
               if(isDesktop)
              Expanded(
              flex: 3,
              child: SummaryWidget(),
              ),
          ],
        ),
      )
    );
  }
}