
import 'package:eco_wise/model/bar_graph_model.dart';
import 'package:eco_wise/model/graph_model.dart';
import 'package:flutter/material.dart';

class BarGraphData {
  final data = [
    const BarGraphModel(
        label: "Charging Level",
        color: Color(0xFFFEB95A),
        graph: [
          GraphModel(x: 0, y: 7.82),
          GraphModel(x: 1, y: 7.87),
          GraphModel(x: 2, y: 7.85),
          GraphModel(x: 3, y: 7.88),
          GraphModel(x: 4, y: 7.88),
          GraphModel(x: 5, y: 7.91),
        ]),
    const BarGraphModel(label: "Light Energy", color: Color(0xFFF2C8ED), graph: [
      GraphModel(x: 0, y: 35.78),
      GraphModel(x: 1, y: 35.52),
      GraphModel(x: 2, y: 35.67),
      GraphModel(x: 3, y: 34.89),
      GraphModel(x: 4, y: 34.94),
      GraphModel(x: 5, y: 35.68),
    ]),
    const BarGraphModel(
        label: "Heating",
        color: Color(0xFF20AEF3),
        graph: [
          GraphModel(x: 0, y: 55.01),
          GraphModel(x: 1, y: 52.65),
          GraphModel(x: 2, y: 53.89),
          GraphModel(x: 3, y: 51.27),
          GraphModel(x: 4, y: 49.82),
          GraphModel(x: 5, y: 55.09),
        ]),
  ];

  final label = ['M', 'T', 'W', 'T', 'F', 'S'];
}
