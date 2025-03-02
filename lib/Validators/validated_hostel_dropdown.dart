import 'package:eco_wise/Core/constants/colours.dart';
import 'package:flutter/material.dart';
import 'package:eco_wise/services/hostel_database_services.dart';

class ValidatedHostelDropdown extends StatefulWidget {
  final TextEditingController controller;
  final bool allowOther; // ✅ New flag to control "Other" option
  final Function(String)? onChanged;

  const ValidatedHostelDropdown({
    Key? key,
    required this.controller,
    this.allowOther = true, // ✅ Default: Allows "Other"
    this.onChanged,
  }) : super(key: key);

  @override
  _ValidatedHostelDropdownState createState() => _ValidatedHostelDropdownState();
}

class _ValidatedHostelDropdownState extends State<ValidatedHostelDropdown> {
  String? selectedHostel;
  bool showTextField = false;
  List<String> hostels = ["Loading..."];

  @override
  void initState() {
    super.initState();
    _loadHostels();
  }

  void _loadHostels() async {
    List<String> fetchedHostels = await HostelDatabaseService().fetchHostelNames();
    
    if (widget.allowOther) {
      fetchedHostels.add("Other"); // ✅ Add "Other" only if allowed
    }

    setState(() {
      hostels = fetchedHostels;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.grey.withAlpha((0.35 * 255).toInt()),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonFormField<String>(
            value: selectedHostel,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              border: InputBorder.none,
              hintText: "Select Hostel",
              hintStyle: TextStyle(color: Colors.white),
              fillColor: cardBackgroundColor,
            ),
            dropdownColor: Colors.grey.withAlpha((0.35 * 255).toInt()),
            items: hostels.map((hostel) {
              return DropdownMenuItem<String>(
                value: hostel,
                child: Text(hostel, style: TextStyle(color: Colors.white)),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedHostel = newValue;
                widget.controller.text = newValue!;
                widget.onChanged?.call(newValue);

                // ✅ Only show text field if "Other" is selected AND allowed
                showTextField = widget.allowOther && newValue == "Other";
              });
            },
          ),
        ),

        // ✅ Show text field only in DeviceInputForm when "Other" is selected
        if (showTextField)
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withAlpha((0.35 * 255).toInt()),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: widget.controller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  border: InputBorder.none,
                  hintText: "Enter Hostel Name",
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
