import 'package:flutter/material.dart';

class HostelSelectionDropdown extends StatefulWidget {
  final TextEditingController controller;

  const HostelSelectionDropdown({super.key, required this.controller});

  @override
  _HostelSelectionDropdownState createState() => _HostelSelectionDropdownState();
}

class _HostelSelectionDropdownState extends State<HostelSelectionDropdown> {
  String? selectedHostel;

  final List<String> hostels = ["Hostel A and Hostel B"]; // ✅ Only A & B allowed

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedHostel,
      decoration: InputDecoration(
        labelText: "Select Hostel",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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
          widget.controller.text = newValue!;
        });
      },
      validator: (value) => value == null ? "Please select a hostel" : null,
    );
  }
}
