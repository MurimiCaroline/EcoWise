import 'package:flutter/material.dart';
import 'package:eco_wise/Util/responsive.dart';
import 'package:eco_wise/Widgets/custom_card_widget.dart';
import 'package:eco_wise/model/energy_model.dart';
import 'package:eco_wise/services/logged_devices_database_services.dart'; // ✅ Import service

class LoggedDevicesCard extends StatefulWidget {
  final String selectedHostel; // ✅ Get selected hostel name

  const LoggedDevicesCard({super.key, required this.selectedHostel});

  @override
  _LoggedDevicesCardState createState() => _LoggedDevicesCardState();
}

class _LoggedDevicesCardState extends State<LoggedDevicesCard> {
  List<EnergyModel> energyDevices = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDevices();
  }

  @override
  void didUpdateWidget(covariant LoggedDevicesCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedHostel != widget.selectedHostel) {
      _loadDevices();
    }
  }

  // ✅ Fetch devices from Firebase when the page loads or hostel changes
  void _loadDevices() async {
    print("Fetching devices for hostel: ${widget.selectedHostel}");
    
    List<EnergyModel> devices = await LoggedDevicesDatabase().fetchLoggedDevices(widget.selectedHostel);

    print("Fetched devices: $devices");

    setState(() {
      energyDevices = devices;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator()) // ✅ Show loader while fetching data
        : energyDevices.isEmpty
            ? Center(child: Text("No Devices Logged for ${widget.selectedHostel}")) // ✅ Show message if empty
            : GridView.builder(
                itemCount: energyDevices.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
                  crossAxisSpacing: Responsive.isMobile(context) ? 12 : 15,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) => CustomCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        energyDevices[index].icon,
                        width: 30,
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 4),
                        child: Text(
                          "${energyDevices[index].value} | ${energyDevices[index].count}x",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        energyDevices[index].title,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }
}
