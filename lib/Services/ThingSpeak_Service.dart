import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:orgfer_recommendation_system/Models/Sensor_Data.dart'; // Already contains SensorData model

class ThingSpeakService {
  final String url = 'https://api.thingspeak.com/channels/2993737/feeds.json?results=2';

  Future<SensorData?> fetchLatestData() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['feeds'] != null && data['feeds'].isNotEmpty) {
          final feed = data['feeds'][0];
          return SensorData.fromJson(feed); 
        } else {
          print("No data found in feeds.");
        }
      } else {
        print("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception occurred: $e");
    }

    return null;
  }
}