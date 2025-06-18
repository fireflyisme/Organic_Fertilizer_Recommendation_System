import 'package:flutter/material.dart';
import 'package:orgfer_recommendation_system/models/recommendation.dart';
import '../models/sensor_data.dart';
import '../services/ml_recommendation_service.dart';

class RecommendationViewModel extends ChangeNotifier {
  final MLService _mlService = MLService();
  Recommendation? recommendation;
  bool isLoading = false;

  Future<void> getRecommendation(SensorData data) async {
    isLoading = true;
    notifyListeners();
    recommendation = _mlService.getRecommendation(data);
    isLoading = false;
    notifyListeners();
  }
}
