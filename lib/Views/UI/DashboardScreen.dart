//import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:orgfer_recommendation_system/Models/Sensor_Data.dart' show SensorData;
import '../../services/thingspeak_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentPageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  SensorData? sensorData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSensorData();
  }

  Future<void> fetchSensorData() async {
    final service = ThingSpeakService();
    final data = await service.fetchLatestData();
    setState(() {
      sensorData = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton.filledTonal(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dashboard",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton.filledTonal(
              onPressed: () {},
              icon: badges.Badge(
                badgeContent: const Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                position: badges.BadgePosition.topEnd(top: -15, end: -12),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: const Color(0xFF4CAF50),
                ),
                child: const Icon(Icons.notifications),
              ),
            ),
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : sensorData == null
              ? const Center(child: Text('No data available'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      _buildSensorCard(
                        icon: Icons.water_drop,
                        label: 'Soil Moisture',
                        value: '${sensorData!.soilMoisture} %',
                      ),
                      _buildSensorCard(
                        icon: Icons.thermostat,
                        label: 'Soil pH',
                        value: '${sensorData!.soilPh} pH',
                      ),
                      _buildSensorCard(
                        icon: Icons.science,
                        label: 'Nitrogen',
                        value: '${sensorData!.nitrogen} %',
                      ),
                      _buildSensorCard(
                        icon: Icons.local_florist,
                        label: 'Phosphorus',
                        value: '${sensorData!.phosphorus} PPM',
                      ),
                      _buildSensorCard(
                        icon: Icons.eco,
                        label: 'Potassium',
                        value: '${sensorData!.potassium} %',
                      ),
                    ],
                  ),
                ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "PROFILE",
            activeIcon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "ABOUT",
            activeIcon: Icon(Icons.info),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: "LOGOUT",
            activeIcon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }

  Widget _buildSensorCard({required IconData icon, required String label, required String value}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.green),
            const SizedBox(height: 12),
            Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}