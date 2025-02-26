import 'package:flutter/material.dart';

class PieChartModel {
  final String title; // Category name (e.g., Lighting, Heating)
  final double value; // Percentage value
  final Color color; // Slice color

  const PieChartModel({
    required this.title,
    required this.value,
    required this.color,
  });
}
