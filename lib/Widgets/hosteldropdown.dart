import 'package:flutter/material.dart';

class HostelDropdown extends StatefulWidget {
  final TextEditingController controller; // ✅ Stores the selected hostel name

  const HostelDropdown({Key? key, required this.controller}) : super(key: key);

  @override
  _HostelDropdownState createState() => _HostelDropdownState();
}

class _HostelDropdownState extends State<HostelDropdown> {
  String? selectedHostel;
  bool showTextField = false; // ✅ Controls whether to show the input field

  final List<String> hostels = [
    "Hostel A",
    "Hostel B",
    "Hostel C",
    "Hostel D",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          value: selectedHostel,
          decoration: InputDecoration(
            labelText: "Select Hostel",
            border: OutlineInputBorder(),
          ),
          items: hostels.map((hostel) {
            return DropdownMenuItem<String>(
              value: hostel,
              child: Text(hostel),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              selectedHostel = newValue;
              if (newValue == "Other") {
                showTextField = true; // ✅ Show input field for custom hostel name
                widget.controller.clear(); // Clear the controller
              } else {
                showTextField = false;
                widget.controller.text = newValue!; // ✅ Save selected hostel name
              }
            });
          },
        ),

        if (showTextField) // ✅ Show text field only when "Other" is selected
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                labelText: "Enter Hostel Name",
                border: OutlineInputBorder(),
              ),
            ),
          ),
      ],
    );
  }
}
