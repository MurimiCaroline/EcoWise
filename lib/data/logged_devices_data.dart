import 'package:eco_wise/Services/logged_devices_database_services.dart';
import 'package:eco_wise/model/energy_model.dart';


class LoggedDevicesData {
  Future<List<EnergyModel>> getLoggedDevices(String hostel) async {
    return await LoggedDevicesDatabase().fetchLoggedDevices(hostel);
  }
}
