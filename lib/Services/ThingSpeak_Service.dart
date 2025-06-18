import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:orgfer_recommendation_system/Models/Sensor_Data.dart' show SensorData;

class ThingSpeakService {
  final String channelId = 'YOUR_CHANNEL_ID';
  final String apiKey = 'YOUR_READ_API_KEY';

  Future<SensorData> fetchLatestData() async {
    final url = 'https://api.thingspeak.com/channels/$channelId/feeds.json?api_key=$apiKey&results=1';
    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    final feed = data['feeds'][0];
    
    return SensorData(
      cropType: feed['field1'] ?? '',
      soilMoisture: double.tryParse(feed['field2'] ?? '0') ?? 0,
      soilPh: double.tryParse(feed['field3'] ?? '0') ?? 0,
      nitrogen: double.tryParse(feed['field4'] ?? '0') ?? 0,
      phosphorus: double.tryParse(feed['field5'] ?? '0') ?? 0,
      potassium: double.tryParse(feed['field6'] ?? '0') ?? 0,
    );
  }
}