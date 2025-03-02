class EnergyModel {
  final String icon;  // ✅ Image path
  final String value; // ✅ Rating in watts
  final String title; // ✅ Device name
  final int count;    // ✅ Number of devices

  EnergyModel({
    required this.icon,
    required this.value,
    required this.title,
    required this.count,
  });

  // ✅ Convert Firebase snapshot to EnergyModel
  factory EnergyModel.fromMap(Map<dynamic, dynamic> data) {
    return EnergyModel(
      icon: _getImagePath(data["Device"] ?? ""), // ✅ Get image based on device name
      value: "${data["Rating"] ?? "0"}W", // ✅ Convert to "W" format
      title: data["Device"] ?? "Unknown Device",
      count: int.tryParse(data["Number of Devices"] ?? "1") ?? 1, // ✅ Handle count
    );
  }

  // ✅ Map device names to image paths
  static String _getImagePath(String device) {
    Map<String, String> images = {
      "Phone Charger": "assets/images/phonecharger.jpg",
      "Laptop Charger": "assets/images/laptopcharger.jpg",
      "Electric Kettle": "assets/images/electrickettle.jpg",
      "Immersion Heater": "assets/images/immersionheater.jpg",
       "Fluorescent Bulbs": "assets/images/bulb.jpg",
     "Radio" : "assets/images/radio.jpg",
     "Sound Woofer" : "assets/images/radio.jpg",
    "Iron Box" : "assets/images/ironbox.jpg",

    };
    return images[device] ?? "assets/images/default.png"; // ✅ Default image if not found
  }
}
