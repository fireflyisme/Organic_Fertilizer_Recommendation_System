import 'package:flutter/material.dart';
import 'package:orgfer_recommendation_system/models/recommendation.dart';
import '../Models/Sensor_Data.dart';
import '../services/ml_recommendation_service.dart';

class RecommendationViewModel extends ChangeNotifier {
  final MLService _mlService = MLService();
  Recommendation? recommendation;
  bool isLoading = false;

  Future<void> getRecommendation(SensorData data) async {
    isLoading = true;
    notifyListeners();
    recommendation = await _mlService.getRecommendation(data) as Recommendation?;
    isLoading = false;
    notifyListeners();
  }
}
