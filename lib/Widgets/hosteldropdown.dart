import 'package:eco_wise/Services/hostel_database_services.dart';
import 'package:flutter/material.dart';


class HostelDropdown extends StatefulWidget {
  final TextEditingController controller;
  final bool showOther;
  final Function(String)? onChanged; // ✅ New callback function

  const HostelDropdown({Key? key, required this.controller, this.showOther = true, this.onChanged}) : super(key: key);

  @override
  _HostelDropdownState createState() => _HostelDropdownState();
}

class _HostelDropdownState extends State<HostelDropdown> {
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
    if (widget.showOther) {
      fetchedHostels.add("Other");
    }

    setState(() {
      hostels = fetchedHostels;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
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
              widget.onChanged?.call(newValue); // ✅ Notify `LoggedDevices`
            });
          },
        ),
      ],
    );
  }
}
