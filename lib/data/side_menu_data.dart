import 'package:eco_wise/model/menu_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SideMenuData {
  final menu =  <MenuModel>[
    MenuModel(icon: Icons.home, title: 'Dashboard', onTap: () {  }),
    MenuModel(icon: Icons.person, title: 'Profile', onTap: () {  }),
    MenuModel(icon: Icons.run_circle, title: 'Usage', onTap: () {  }),
    MenuModel(icon: Icons.settings, title: 'Settings', onTap: () {  }),
    MenuModel(icon: Icons.history, title: 'AI Recommendations', onTap: () {  }),
    MenuModel(icon: Icons.logout, title: 'SignOut', onTap:() {
      FirebaseAuth.instance.signOut();
                      } ),
  ];
}


