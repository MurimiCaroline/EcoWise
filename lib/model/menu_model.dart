import 'package:flutter/material.dart';

class MenuModel{
  final IconData icon;
  final String title;
  final Function() onTap;

  const MenuModel({required this.icon, required this.title, required this.onTap});
}

