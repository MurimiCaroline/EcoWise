import 'package:flutter/material.dart';
import 'package:eco_wise/services/hostel_database_services.dart';

class HostelDropdown extends StatefulWidget {
  final TextEditingController controller;
  final bool showOther;
  final Function(String)? onChanged;

  const HostelDropdown({Key? key, required this.controller, this.showOther = true, this.onChanged})
      : super(key: key);

  @override
  _HostelDropdownState createState() => _HostelDropdownState();
}

class _HostelDropdownState extends State<HostelDropdown> {
  String? selectedHostel;
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
    return Container(
      width: double.infinity, // ✅ Full width
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha((0.35 * 255).toInt()),
        borderRadius: BorderRadius.circular(10), // ✅ Rounded edges
      ),
      child: DropdownButtonFormField<String>(
        value: selectedHostel,
        decoration: InputDecoration(
          labelText: "Select Hostel",
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // ✅ Match DeviceDropdown
          ),
        ),
        dropdownColor: Colors.grey.withAlpha((0.35 * 255).toInt()),
        items: hostels.map((hostel) {
          return DropdownMenuItem<String>(
            value: hostel,
            child: Row(
              children: [
                Icon(Icons.apartment, color: Colors.white), // ✅ Optional icon
                SizedBox(width: 10),
                Text(hostel, style: TextStyle(color: Colors.white)),
              ],
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            selectedHostel = newValue;
            widget.controller.text = newValue!;
            widget.onChanged?.call(newValue);
          });
        },
      ),
    );
  }
}
