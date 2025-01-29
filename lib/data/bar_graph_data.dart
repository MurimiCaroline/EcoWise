
import 'package:eco_wise/model/bar_graph_model.dart';
import 'package:eco_wise/model/graph_model.dart';
import 'package:flutter/material.dart';

class BarGraphData {
  final data = [
    const BarGraphModel(
        label: "Charging Level",
        color: Color(0xFFFEB95A),
        graph: [
          GraphModel(x: 0, y: 8),
          GraphModel(x: 1, y: 10),
          GraphModel(x: 2, y: 7),
          GraphModel(x: 3, y: 4),
          GraphModel(x: 4, y: 4),
          GraphModel(x: 5, y: 6),
        ]),
    const BarGraphModel(label: "Light Energy", color: Color(0xFFF2C8ED), graph: [
      GraphModel(x: 0, y: 8),
      GraphModel(x: 1, y: 10),
      GraphModel(x: 2, y: 9),
      GraphModel(x: 3, y: 6),
      GraphModel(x: 4, y: 6),
      GraphModel(x: 5, y: 7),
    ]),
    const BarGraphModel(
        label: "Heating",
        color: Color(0xFF20AEF3),
        graph: [
          GraphModel(x: 0, y: 7),
          GraphModel(x: 1, y: 10),
          GraphModel(x: 2, y: 7),
          GraphModel(x: 3, y: 4),
          GraphModel(x: 4, y: 4),
          GraphModel(x: 5, y: 10),
        ]),
  ];

  final label = ['M', 'T', 'W', 'T', 'F', 'S'];
}
