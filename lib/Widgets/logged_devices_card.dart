import 'package:eco_wise/Util/responsive.dart';
import 'package:eco_wise/Widgets/custom_card_widget.dart';
import 'package:eco_wise/data/logged_devices.dart';
import 'package:flutter/material.dart';

class LoggedDevicesCard extends StatelessWidget {
  const LoggedDevicesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final energyDetails =LoggedDevicesData();
    
    return GridView.builder(
      itemCount: energyDetails.energyData.length,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
      crossAxisSpacing: Responsive.isMobile(context) ? 12 : 15,
      mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) => CustomCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              energyDetails.energyData[index].icon,
              width: 30,
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 4),
              child: Text(
                energyDetails.energyData[index].value,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
                energyDetails.energyData[index].title,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
              ),
          ],
        ),
      ),
    );
  }
}