import 'package:eco_wise/model/icon_menu_model.dart';
import 'package:flutter/material.dart';

class BottonNavData {
  final menu =  <MenuModel>[
    MenuModel(icon: Icons.menu, title: 'Dashboard', onTap: (){ }),
    MenuModel(icon: Icons.home, title: 'Analytics', onTap: () {  }),
    MenuModel(icon: Icons.person, title: 'Profile', onTap: () {  }),
    MenuModel(icon: Icons.run_circle, title: 'AI recommendations', onTap: () { 
      
     }),
    
                     
  ];
}