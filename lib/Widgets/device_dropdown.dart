import 'package:flutter/material.dart';

class DeviceDropdown extends StatefulWidget {
  final TextEditingController controller; // ✅ Store selected device

  const DeviceDropdown({Key? key, required this.controller}) : super(key: key);

  @override
  _DeviceDropdownState createState() => _DeviceDropdownState();
}

class _DeviceDropdownState extends State<DeviceDropdown> {
  String? selectedDevice;

  final List<Map<String, String>> devices = [
    {"name": "Phone Charger", "image": "assets/images/phonecharger.jpg"},
    {"name": "Laptop Charger", "image": "assets/images/laptopcharger.jpg"},
    {"name": "Electric Kettle", "image": "assets/images/electrickettle.jpg"},
    {"name": "Immersion Heater", "image": "assets/images/immersionheater.jpg"},
    {"name": "Fluorescent Bulbs", "image": "assets/images/bulb.jpg"},
    {"name": "Radios", "image": "assets/images/radio.jpg"},
    {"name": "Sound Woofer", "image": "assets/images/radio.jpg"},
    {"name": "Iron Box", "image": "assets/images/ironbox.jpg"},

  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedDevice,
      decoration: InputDecoration(
        labelText: "Select a Device",
        border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10), // ✅ Rounded edges
    ),
      ),
      items: devices.map((device) {
        return DropdownMenuItem<String>(
          value: device["name"],
          child: Row(
            children: [
              Image.asset(
                device["image"]!,
                width: 30, height: 30,
              ),
              SizedBox(width: 10),
              Text(device["name"]!),
            ],
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          selectedDevice = newValue;
          widget.controller.text = newValue!;
        });
      },
    );
  }
}
