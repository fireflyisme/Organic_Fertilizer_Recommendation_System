
//import 'package:flutter/material.dart';

class SensorData {
  String cropType;
  double soilMoisture;
  double soilPh;
  double nitrogen;
  double phosphorus;
  double potassium;

  SensorData({
    required this.cropType,
    required this.soilMoisture,
    required this.soilPh,
    required this.nitrogen,
    required this.phosphorus,
    required this.potassium,
  });
}