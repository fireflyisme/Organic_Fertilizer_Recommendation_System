import 'package:orgfer_recommendation_system/Models/Sensor_Data.dart';
import '../Models/Recommendation.dart' show Recommendation;

class MLService {
  Recommendation getRecommendation(SensorData data) {
    // Mock logic; replace with real ML model or API call
    if (data.soilMoisture < 6.5) { // change to pH after testing IOT
      return Recommendation(
        fertilizer: "Compost",
        explanation: "Based on current soil conditions, compost is ideal.",
      );
    }
    return Recommendation(
      fertilizer: "Vermicompost",
      explanation: "Soil moisture is optimal. Vermicompost is recommended.", // change to pH after testing IOT
    );
  }
}