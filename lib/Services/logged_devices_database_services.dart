import 'package:firebase_database/firebase_database.dart';
import 'package:eco_wise/model/energy_model.dart';

class LoggedDevicesDatabase {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

 
 Future<List<EnergyModel>> fetchLoggedDevices(String hostel) async {
  List<EnergyModel> devices = [];

  try {
    DatabaseEvent event = await _dbRef.child('Devices').once();
    
    if (event.snapshot.exists) {
      Map<dynamic, dynamic>? data = event.snapshot.value as Map?;

      if (data != null) {
        print("Raw Firebase Data: $data"); // ✅ Print fetched raw data

        for (var deviceData in data.values) {
          print("Checking device: $deviceData"); // ✅ Print each device entry
if (deviceData is Map && deviceData["Hostel Name"]?.trim().toLowerCase() == hostel.trim().toLowerCase()) {
  print("Match found: ${deviceData["Device"]}"); // ✅ Now it should match
  devices.add(EnergyModel.fromMap(deviceData));
}

        }
      }
    }
  } catch (e) {
    print("Error fetching logged devices: $e");
  }

  return devices;
}
 // ✅ Fetch devices dynamically from Firebase
}
