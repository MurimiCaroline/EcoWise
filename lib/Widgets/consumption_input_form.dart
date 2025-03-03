import 'package:eco_wise/Core/constants/dimensions.dart';
import 'package:eco_wise/Services/consumption_database_service.dart';
import 'package:eco_wise/Widgets/consumption_hostel_dropdown.dart';
import 'package:eco_wise/Widgets/form_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConsumptionInputForm extends StatefulWidget {
  const ConsumptionInputForm({super.key});

  @override
  _ConsumptionInputFormState createState() => _ConsumptionInputFormState();
}

class _ConsumptionInputFormState extends State<ConsumptionInputForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController voltageController = TextEditingController();
  final TextEditingController currentController = TextEditingController();
  final TextEditingController powerFactorController = TextEditingController();
  final TextEditingController hostelController = TextEditingController();
  final TextEditingController dateController = TextEditingController(); // ✅ Date Picker Controller

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024, 1, 1),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        dateController.text = DateFormat("yyyy-MM-dd").format(pickedDate);
      });
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      await ConsumptionDatabaseService().addConsumptionData(
        hostelName: hostelController.text,
        voltage: voltageController.text,
        current: currentController.text,
        powerFactor: powerFactorController.text,
        date: dateController.text, // ✅ Save date to DB
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Consumption Data Added Successfully!"), backgroundColor: Colors.green),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Consumption Data"),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HostelSelectionDropdown(controller: hostelController),
              SizedBox(height: Dimensions.medium),
              FormContainerWidget(
                controller: voltageController,
                inputType: TextInputType.number,
                labelText: "Voltage (V)",
                hintText: "Enter Voltage",
                validator: (value) => value!.isEmpty ? "Voltage is required" : null,
              ),
              SizedBox(height: Dimensions.medium),
              FormContainerWidget(
                controller: currentController,
                inputType: TextInputType.number,
                labelText: "Current (A)",
                hintText: "Enter Current",
                validator: (value) => value!.isEmpty ? "Current is required" : null,
              ),
                SizedBox(height: Dimensions.medium),
              FormContainerWidget(
                controller: powerFactorController,
                inputType: TextInputType.number,
                labelText: "Power Factor",
                hintText: "Enter Power Factor",
                validator: (value) => value!.isEmpty ? "Power Factor is required" : null,
              ),
                SizedBox(height: Dimensions.medium),
              GestureDetector(
                onTap: _pickDate,
                child: AbsorbPointer(
                  child: FormContainerWidget(
                    controller: dateController,
                    labelText: "Select Date",
                    hintText: "Tap to pick a date",
                    validator: (value) => value!.isEmpty ? "Date is required" : null,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: _submitForm,
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
