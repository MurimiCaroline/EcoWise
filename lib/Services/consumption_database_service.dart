import 'package:firebase_database/firebase_database.dart';

class ConsumptionDatabaseService {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref().child('ConsumptionData');

  Future<void> addConsumptionData({
    required String hostelName,
    required String voltage,
    required String current,
    required String powerFactor,
    required String date, // ✅ Include Date
  }) async {
    await _dbRef.push().set({
      'Hostel Name': hostelName,
      'Voltage': voltage,
      'Current': current,
      'Power Factor': powerFactor,
      'Date': date, // ✅ Store the date
      'Timestamp': DateTime.now().toIso8601String(),
    });
  }
}
