
import 'package:eco_wise/model/icon_menu_model.dart';
import 'package:flutter/material.dart';

class BottonNavData {
  final menu = <MenuModel>[
    MenuModel(icon: Icons.home_filled, title: 'Home Page', onTapWithIndex: 0),
    MenuModel(icon: Icons.auto_graph, title: 'Analytics', onTapWithIndex: 1),
    MenuModel(icon: Icons.person, title: 'Add devices', onTapWithIndex: 2),
    MenuModel(icon: Icons.run_circle, title: 'AI recommendations', onTapWithIndex: 3),
  ];
}
