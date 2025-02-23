import 'package:flutter/material.dart';



class MenuModel {
  final IconData icon;
  final String title;
  final int? onTapWithIndex; // ✅ Now using index switching

  const MenuModel({
    required this.icon,
    required this.title,
    this.onTapWithIndex, // ✅ Supports Bottom Navigation Index
  });
}
