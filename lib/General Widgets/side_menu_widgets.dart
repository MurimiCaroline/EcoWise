import 'package:eco_wise/data/side_menu_data.dart';
import 'package:flutter/material.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();
    return  Container(
      child: ListView.builder(
        itemCount: data.menu.length,
        itemBuilder: (context, index) => buildMenuEntry(data, index),
        ),
    );
  }
  Widget buildMenuEntry(SideMenuData data, int index){
  return Row(
   children: [
     Icon(
      data.menu[index].icon,
      color: Colors.grey,
    ),
    Text(
      data.menu[index].title,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
    ),
   ],
  );

}
}

