import 'package:eco_wise/Core/constants/colours.dart';
import 'package:flutter/material.dart';

import '../../General Widgets/side_menu_widgets.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard UI'),
      ),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child:SizedBox(
                child: SideMenuWidget(),
              ),
              ),
              Expanded(
              flex: 7,
              child: Container(
                color: primaryColor,
              ),
              ),
              Expanded(
              flex: 3,
              child: Container(
                color: Colors.red,
              ),
              ),
          ],
        ),
      )
    );
  }
}