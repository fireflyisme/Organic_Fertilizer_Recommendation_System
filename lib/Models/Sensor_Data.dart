
//import 'package:flutter/material.dart';

class SensorData {
  //String cropType;
  double soilMoisture;
  double soilPh;
  double nitrogen;
  double phosphorus;
  double potassium;

  SensorData({
    //required this.cropType,
    required this.soilMoisture,
    required this.soilPh,
    required this.nitrogen,
    required this.phosphorus,
    required this.potassium,
  });

  factory SensorData.fromJson(Map<String, dynamic> json) {
    return SensorData(
      //cropType: json['field0'] ?? 'Unknown',
      soilMoisture: double.parse(json['field1'] ?? '0'),
      soilPh: double.parse(json['field2'] ?? '0'),
      nitrogen: double.parse(json['field3'] ?? '0'),
      phosphorus: double.parse(json['field4'] ?? '0'),
      potassium: double.parse(json['field5'] ?? '0'),
    );
  }
}