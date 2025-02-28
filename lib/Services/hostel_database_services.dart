import 'package:firebase_database/firebase_database.dart';

class HostelDatabaseService {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  Future<List<String>> fetchHostelNames() async {
    Set<String> hostels = {"Hostel A", "Hostel B", "Hostel C", "Hostel D"}; // Default values

    try {
      DatabaseEvent event = await _dbRef.child('Devices').once();
      if (event.snapshot.exists) {
        Map<dynamic, dynamic>? data = event.snapshot.value as Map?;
        if (data != null) {
          for (var device in data.values) {
            if (device is Map && device.containsKey("Hostel Name")) {
              hostels.add(device["Hostel Name"].toString()); // ✅ Add hostel name dynamically
            }
          }
        }
      }
    } catch (e) {
      print("Error fetching hostels: $e");
    }

    return hostels.toList();
  }
}
