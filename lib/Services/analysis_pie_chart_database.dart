import 'package:firebase_database/firebase_database.dart';

class AnalysisPieChartDatabase {
  final DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('Devices');

  Future<Map<String, double>> fetchPieChartData(String selectedHostel) async {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('Devices');

  DatabaseEvent event = await dbRef.once();
  if (!event.snapshot.exists) {
    print("⚠️ No data found in Firebase!");
    return {};
  }

  Map<dynamic, dynamic>? data = event.snapshot.value as Map?;
  if (data == null) {
    print("⚠️ Firebase snapshot is null!");
    return {};
  }

  // Initialize consumption categories
  double lighting = 0, heating = 0, charging = 0, entertainment = 0, total = 0;

  data.forEach((key, value) {
    String hostel = value["Hostel Name"] ?? "";
    String device = value["Device"] ?? "";
    double rating = double.tryParse(value["Rating"] ?? "0") ?? 0;
    int number = int.tryParse(value["Number of Devices"] ?? "1") ?? 1;
    double duration = double.tryParse(value["Daily usage in hours"] ?? "0") ?? 0;

    // ✅ Filter by selected hostel
    if (hostel == selectedHostel) {
      double consumption = rating * number * duration; 
      total += consumption;

      // ✅ Categorize devices
      if (["Fluorescent Bulbs"].contains(device)) {
        lighting += consumption;
      } else if (["Electric Kettle", "Immersion Heater", "Iron Box"].contains(device)) {
        heating += consumption;
      } else if (["Phone Charger", "Laptop Charger"].contains(device)) {
        charging += consumption;
      } else if (["Radio", "Sound Woofer"].contains(device)) {
        entertainment += consumption;
      }
    }
  });

  // ✅ Debugging prints
  print("🔹 Lighting: $lighting, Heating: $heating, Charging: $charging, Entertainment: $entertainment, Total: $total");

  if (total == 0) {
    print("⚠️ No consumption data found for $selectedHostel!");
    return {};
  }

  return {
    "Lighting": (lighting / total) * 100,
    "Heating": (heating / total) * 100,
    "Charging": (charging / total) * 100,
    "Entertainment": (entertainment / total) * 100,
  };
}


  // ✅ Fetch Data Based on Hostel Selection
  Future<Map<String, double>> fetchConsumptionData(String hostelName) async {
    DatabaseEvent event = await dbRef.once();
    if (!event.snapshot.exists) {
      print("⚠ No data found for $hostelName");
      return {};
    }

    Map<dynamic, dynamic> devices = event.snapshot.value as Map<dynamic, dynamic>;

    double totalConsumption = 0;
    double lightingConsumption = 0;
    double heatingConsumption = 0;
    double chargingConsumption = 0;
    double entertainmentConsumption = 0;

    devices.forEach((key, device) {
      if (device["Hostel Name"] != hostelName) return;

      double rating = double.tryParse(device["Rating"] ?? "0") ?? 0;
      int number = int.tryParse(device["Number of Devices"] ?? "0") ?? 0;
      double duration = double.tryParse(device["Duration of Use"] ?? "0") ?? 0;

      double consumption = rating * number * duration; // ✅ Energy per device
      totalConsumption += consumption;

      // ✅ Categorizing devices
      if (device["Device"].contains("Bulb")) {
        lightingConsumption += consumption;
      } else if (device["Device"].contains("Kettle") ||
          device["Device"].contains("Heater") ||
          device["Device"].contains("Iron Box")) {
        heatingConsumption += consumption;
      } else if (device["Device"].contains("Charger")) {
        chargingConsumption += consumption;
      } else if (device["Device"].contains("Radio") ||
          device["Device"].contains("Woofer")) {
        entertainmentConsumption += consumption;
      }
    });

    if (totalConsumption == 0) return {}; // Avoid division by zero

    // ✅ Return Calculated Percentages
    return {
      "Lighting": (lightingConsumption / totalConsumption) * 100,
      "Heating": (heatingConsumption / totalConsumption) * 100,
      "Charging": (chargingConsumption / totalConsumption) * 100,
      "Entertainment": (entertainmentConsumption / totalConsumption) * 100,
    };
  }
}
