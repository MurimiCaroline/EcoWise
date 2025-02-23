import 'package:eco_wise/Core/constants/colours.dart';
import 'package:eco_wise/Util/responsive.dart';
import 'package:eco_wise/Widgets/summary_widget.dart';
import 'package:eco_wise/data/bottomNave_data.dart';
import 'package:eco_wise/model/icon_menu_model.dart';
 // Import BottomNavData
import 'package:eco_wise/widgets/dashboard_widget.dart';
import 'package:eco_wise/widgets/side_menu_widgets.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  // Use the menu from BottomNavData
  final List<MenuModel> menuItems = BottonNavData().menu;

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      drawer: !isDesktop
          ? const SizedBox(width: 300, child: SideMenuWidget())
          : null,
      endDrawer: Responsive.isMobile(context)
          ? SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const SummaryWidget(),
            )
          : null,
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            DashboardWidget(),
            
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        
        items: menuItems.map((menu) {
          return BottomNavigationBarItem(
            icon: Icon(menu.icon),
            label: menu.title,
          );
        }).toList(),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          menuItems[index].onTap();
        },
        backgroundColor: cardBackgroundColor, // Background color
  selectedItemColor: Colors.blueAccent, // Selected item color
  unselectedItemColor: Colors.grey, // Unselected item color
  showSelectedLabels: true, // Show labels for selected items
  showUnselectedLabels: true,
      ),
    );
  }
}
