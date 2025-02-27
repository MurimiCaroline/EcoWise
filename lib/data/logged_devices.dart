import 'package:eco_wise/model/energy_model.dart';

class LoggedDevicesData{
  final energyData = [
    EnergyModel(icon: "assets/images/phonecharger.jpg", value: "242W", title: "Phone Charger"),
    EnergyModel(icon: "assets/images/laptopcharger.jpg", value: "13W", title: "Laptop Charger"),
    EnergyModel(icon: "assets/images/electrickettle.jpg", value: "24w", title: "Electric Kettle"),
    EnergyModel(icon: "assets/images/immersionheater.jpg", value: "19w", title: "Immersion Heater"),
  ];
}