import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // ✅ For formatting the date

class DatePickerWidget extends StatefulWidget {
  final TextEditingController controller;

  const DatePickerWidget({Key? key, required this.controller}) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // ✅ Default to today
      firstDate: DateTime(2000), // ✅ Limit to year 2000+
      lastDate: DateTime(2100), // ✅ Limit to year 2100
    );

    if (pickedDate != null) {
      setState(() {
        widget.controller.text = DateFormat('yyyy-MM-dd').format(pickedDate); // ✅ Format Date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      readOnly: true, 
      decoration: InputDecoration(
        labelText: "Select Date",
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () => _selectDate(context), 
        ),
      ),
    );
  }
}
