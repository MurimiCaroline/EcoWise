import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';

class LineData {
  List<FlSpot> spots = [];
  Map<int, String> bottomTitle = {};
  Map<int, String> leftTitle = {
    220: '220kW',
    240: '240kW',
    260: '260kW',
    280: '280kW',
    300: '300kW',
  };

  Future<void> fetchDataForWeek(String selectedWeek) async {
    DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('ConsumptionData');

    DatabaseEvent event = await dbRef.once();
    if (!event.snapshot.exists) return;

    Map<dynamic, dynamic>? data = event.snapshot.value as Map?;
    if (data == null) return;

    List<FlSpot> newSpots = [];
    Map<int, String> newBottomTitle = {};
    
    List<String> weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri"];
    
    data.forEach((key, value) {
      String date = value["Date"] ?? "";
      double current = double.tryParse(value["Current"] ?? "0") ?? 0;
      double voltage = double.tryParse(value["Voltage"] ?? "0") ?? 0;
      double powerFactor = double.tryParse(value["Power Factor"] ?? "0") ?? 0;

      if (date.isNotEmpty && date.compareTo("2025-01-06") >= 0 && date.startsWith(selectedWeek)) {
        double consumption = current * voltage * powerFactor * 24;

        // ✅ Convert Date to Weekday Index (0=Mon, 1=Tue, ...)
        DateTime parsedDate = DateTime.parse(date);
        int weekdayIndex = parsedDate.weekday - 1;  

        // ✅ Ensure we are only adding Mon-Fri (ignore Sat & Sun)
        if (weekdayIndex < 5) {
          newSpots.add(FlSpot(weekdayIndex.toDouble(), consumption));

          // ✅ Map correct weekday label
          newBottomTitle[weekdayIndex] = weekdays[weekdayIndex];

          print("📌 Added Data: X=$weekdayIndex, Y=$consumption, Label=${newBottomTitle[weekdayIndex]}");
        }
      }
    });

    spots = newSpots;
    bottomTitle = newBottomTitle;
  }
}
