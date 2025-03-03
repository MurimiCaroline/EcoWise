import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekSelectionDropdown extends StatefulWidget {
  final ValueChanged<String> onWeekSelected;

  const WeekSelectionDropdown({super.key, required this.onWeekSelected});

  @override
  _WeekSelectionDropdownState createState() => _WeekSelectionDropdownState();
}

class _WeekSelectionDropdownState extends State<WeekSelectionDropdown> {
  String? selectedWeek;
  List<String> availableWeeks = [];

  @override
  void initState() {
    super.initState();
    _generateWeeks();
  }

  void _generateWeeks() {
    DateTime start = DateTime(2025, 1, 6); // ✅ Start from 6th January 2025
    DateTime now = DateTime.now();

    while (start.isBefore(now)) {
      availableWeeks.add(DateFormat("yyyy-MM-dd").format(start));
      start = start.add(Duration(days: 7)); // ✅ Move to the next week
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedWeek,
      decoration: InputDecoration(labelText: "Select Week"),
      items: availableWeeks.map((week) {
        return DropdownMenuItem<String>(
          value: week,
          child: Text(week),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          selectedWeek = newValue;
        });
        widget.onWeekSelected(newValue!);
      },
    );
  }
}
