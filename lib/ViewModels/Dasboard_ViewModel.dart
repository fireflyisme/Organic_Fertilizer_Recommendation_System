import 'package:flutter/material.dart';
import '../models/sensor_data.dart';
import '../services/thingspeak_service.dart';

class DashboardViewModel extends ChangeNotifier {
  final ThingSpeakService _service = ThingSpeakService();
  SensorData? sensorData;
  bool isLoading = false;

  Future<void> fetchSensorData() async {
    isLoading = true;
    notifyListeners();
    sensorData = await _service.fetchLatestData();
    isLoading = false;
    notifyListeners();
  }
}