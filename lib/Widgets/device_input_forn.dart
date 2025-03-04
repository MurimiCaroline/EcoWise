import 'package:eco_wise/Validators/validated_hostel_dropdown.dart';
import 'package:eco_wise/Widgets/device_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:eco_wise/Core/constants/dimensions.dart';
import 'package:eco_wise/Widgets/form_container_widget.dart';

class DeviceInputForm extends StatefulWidget {
  const DeviceInputForm({Key? key}) : super(key: key);

  @override
  State<DeviceInputForm> createState() => _DeviceInputFormState();
}

class _DeviceInputFormState extends State<DeviceInputForm> {
  final _formKey = GlobalKey<FormState>(); // ✅ Form Key

  final hostelNameController = TextEditingController();
  final applianceNameController = TextEditingController();
  final applianceRatingController = TextEditingController();
  final applianceNumberController = TextEditingController();
  final applianceDurationController = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Devices');
  }

 void _submitForm() async {
  if (!_formKey.currentState!.validate()) return;

  bool? confirm = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirm Submission"),
        content: Text("Are you sure you want to add this device?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false), 
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true), 
            child: Text("Confirm"),
          ),
        ],
      );
    },
  );

  if (confirm == true) {
    try {
      await dbRef.push().set({
        'Hostel Name': hostelNameController.text,
        'Device': applianceNameController.text,
        'Rating': applianceRatingController.text,
        'Number of Devices': applianceNumberController.text,
        'Daily usage in hours': applianceDurationController.text, // ✅ Fixed
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Device Added Successfully!"), backgroundColor: Colors.green),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to add device! Try again."), backgroundColor: Colors.red),
      );
      print("🔥 Firebase Error: $e"); // ✅ Debugging print statement
    }
  }
}


   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey, // ✅ Attach form key
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              const Text(
                'Add Device Data',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Dimensions.large),
             
              FormField<String>(
                validator: (value) {
                  if (hostelNameController.text.isEmpty) {
                    return "Please select a hostel";
                  }
                  return null;
                },
                builder: (FormFieldState<String> state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ValidatedHostelDropdown(
                        controller: hostelNameController,
                        allowOther: true,
                      ),
                      if (state.hasError)
                        Padding(
                          padding: EdgeInsets.only(top: 5, left: 10),
                          child: Text(
                            state.errorText!,
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                    ],
                  );
                },
              ),

              const SizedBox(height: Dimensions.large),

              // ✅ Wrap `DeviceDropdown` with FormField to validate it
              FormField<String>(
                validator: (value) {
                  if (applianceNameController.text.isEmpty) {
                    return "Please select a device";
                  }
                  return null;
                },
                builder: (FormFieldState<String> state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DeviceDropdown(controller: applianceNameController),
                      if (state.hasError)
                        Padding(
                          padding: EdgeInsets.only(top: 5, left: 10),
                          child: Text(
                            state.errorText!,
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                    ],
                  );
                },
              ),

              const SizedBox(height: Dimensions.large),

              FormContainerWidget(
                controller: applianceRatingController,
                inputType: TextInputType.number,
                labelText: 'Rating in W',
                hintText: 'Rating of Device W',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter device rating";
                  }
                  return null;
                },
              ),
              const SizedBox(height: Dimensions.large),

              FormContainerWidget(
                controller: applianceNumberController,
                inputType: TextInputType.number,
                labelText: 'Number of Devices',
                hintText: 'Number of Devices',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the number of devices";
                  }
                  return null;
                },
              ),
              const SizedBox(height: Dimensions.large),
              FormContainerWidget(
  controller: applianceDurationController, // ✅ New Controller
  inputType: TextInputType.number,
  labelText: 'Daily usage in hours',
  hintText: 'Daily usage in hours',
  validator: (value) {
    if (value == null || value.isEmpty) {
      return "Please enter the duration of use";
    }
    return null;
  },
),

              const SizedBox(height: Dimensions.large),


              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha((0.35 * 255).toInt()),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MaterialButton(
                  onPressed: _submitForm, // ✅ Call validation & submission
                  child: const Text('Add Data', style: TextStyle(color: Colors.white)),
                  minWidth: 300,
                  height: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
