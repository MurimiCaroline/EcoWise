import 'package:eco_wise/Widgets/device_dropdown.dart';
import 'package:eco_wise/Widgets/hosteldropdown.dart';
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
  final hostelNameController = TextEditingController();
  final applianceNameController = TextEditingController();
  final applianceRatingController = TextEditingController();
  
  final applianceNumberController = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Devices');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16, // ✅ Adjusts for keyboard
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // ✅ Ensures it doesn't take full screen height
          children: [
            // ✅ Close Button (X) at the top
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context), // ✅ Closes the modal
              ),
            ),

            const Text(
              'Add Device Data',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Dimensions.large),

            HostelDropdown(controller: hostelNameController),
            const SizedBox(height: Dimensions.large),

            DeviceDropdown(controller: applianceNameController),
            const SizedBox(height: Dimensions.large),

            FormContainerWidget(
              controller: applianceRatingController,
              inputType: TextInputType.number,
              labelText: 'Rating in KW',
              hintText: 'Rating of Device KW',
            ),
            const SizedBox(height: Dimensions.large),
            FormContainerWidget(
              controller: applianceNumberController,
              inputType: TextInputType.number,
              labelText: 'Number of Devices',
              hintText: 'Number of Devices',
            ),
            const SizedBox(height: Dimensions.large),
             
            

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.35),
                borderRadius: BorderRadius.circular(10),
              ),
              child: MaterialButton(
                onPressed: () {
                  Map<String, String> devices = {
                    'Hostel Name': hostelNameController.text,
                    'Device': applianceNameController.text,
                    'Rating': applianceRatingController.text,
                    
                  };

                  dbRef.push().set(devices);
                  Navigator.pop(context); // ✅ Closes the modal after inserting data
                },
                child: const Text('Insert Data', style: TextStyle(color: Colors.white)),
                minWidth: 300,
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
