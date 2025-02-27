import 'package:eco_wise/Core/constants/colours.dart';
import 'package:eco_wise/Core/constants/dimensions.dart';
import 'package:eco_wise/Widgets/device_input_forn.dart';
import 'package:eco_wise/Widgets/logged_devices_card.dart';
import 'package:flutter/material.dart';


class LoggedDevices extends StatelessWidget {
  const LoggedDevices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.medium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("List of Logged devices"),
            SizedBox(
              height: Dimensions.extralarge,
            ),
            Text("Hostel A"),
            SizedBox(
              height: Dimensions.extralarge,
            ),
            LoggedDevicesCard(),
          ],
        ),
      ), // ✅ Placeholder content

      floatingActionButton: FloatingActionButton(
  onPressed: () {
    showGeneralDialog(
      context: context,
      barrierDismissible: true, // ✅ Allows closing by tapping outside
      barrierLabel: "Dismiss",
      transitionDuration: Duration(milliseconds: 300), // ✅ Smooth animation
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.centerLeft, // ✅ Opens from the left
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7, // ✅ Takes 70% of the screen width
            child: Material(
              color: cardBackgroundColor,
              borderRadius: BorderRadius.horizontal(right: Radius.circular(20), left:  Radius.circular(20)), // ✅ Rounded right edge
              child: DeviceInputForm(), // ✅ Your form widget
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(-0.5, 0), // ✅ Starts offscreen to the left
            end: Offset(0.25, 0), // ✅ Slides into view
          ).animate(animation),
          child: child,
        );
      },
    );
  },
  child: Icon(Icons.add),
  backgroundColor: Colors.grey.withOpacity(.35), // ✅ Matches styling
),

    );
  }
}
