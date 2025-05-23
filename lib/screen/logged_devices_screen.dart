import 'package:eco_wise/Core/constants/colours.dart';
import 'package:eco_wise/Core/constants/dimensions.dart';
import 'package:eco_wise/Validators/validated_hostel_dropdown.dart';
import 'package:eco_wise/Widgets/device_input_forn.dart';
import 'package:eco_wise/Widgets/logged_devices_card.dart';
import 'package:flutter/material.dart';

class LoggedDevices extends StatefulWidget {
  const LoggedDevices({super.key});

  @override
  State<LoggedDevices> createState() => _LoggedDevicesState();
}

class _LoggedDevicesState extends State<LoggedDevices> {
  final ValueNotifier<String> selectedHostel = ValueNotifier<String>("Hostel A"); // ✅ Default hostel

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Padding(
  padding: const EdgeInsets.all(Dimensions.medium),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text("List of Logged Devices"),
      SizedBox(height: Dimensions.extralarge),

      SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ValidatedHostelDropdown(
          controller: TextEditingController(text: selectedHostel.value),
          allowOther: false,
          onChanged: (value) {
            selectedHostel.value = value;
          },
        ),
      ),
      SizedBox(height: Dimensions.extralarge),

      // ✅ Wrap with Expanded & SingleChildScrollView to prevent overflow
      Expanded(
        child: SingleChildScrollView(
          child: ValueListenableBuilder<String>(
            valueListenable: selectedHostel,
            builder: (context, hostel, child) {
              return LoggedDevicesCard(selectedHostel: hostel);
            },
          ),
        ),
      ),
    ],
  ),
),
 floatingActionButton: FloatingActionButton(
        onPressed: () {
          showGeneralDialog(
            context: context,
            barrierDismissible: true,
            barrierLabel: "Dismiss",
            transitionDuration: Duration(milliseconds: 300),
            pageBuilder: (_, __, ___) {
              return Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Material(
                    color: cardBackgroundColor,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(20),
                      left: Radius.circular(20),
                    ),
                    child: DeviceInputForm(),
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey.withAlpha((0.35 * 255).toInt()),
      ),
    );
  }
}
