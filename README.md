# Organic Fertilizer Recommendation System (Mobile Application)

== Component Tech ==
* Mobile Application - Flutter
* Machine Leaning Model - Jupyter Notebook Scikit-learn or pandas (trained), joblib (export)
* Backend/Deployment - FastAPI on RPI or cloud
* rpi_scripts - ESP32 and RPi4 sensor scripts
* Organic-Fertilizer-Recommendation-System (Mobile Application)

1️⃣ Launch Screen
* Displays the app logo and name
* 
2️⃣ Sample Information
* Sample identifier (Name,Surename)
* Sampling Location
* Sampling Date

3️⃣ Dashboard Screen
* Displays real-time sensor data fetched from ThingSpeak Channels
* 🌾 Crop Type (user-selected)
* 💧 Soil Moisture
* 🌡️ Soil pH
* 🧪 Nitrogen (N) level
* 🧪 Phosphorus (P) level
* 🧪 Potassium (K) level

== Data Source ==
* ESP32/Raspberry Pi 4 reads sensors and uploads data to ThingSpeak
* Mobile app retrieves latest values using ThingSpeak REST API
* Recommend Button
* Notification (if there is more time)

4️⃣ Recommendation Screen
* Displays the best organic fertilizer recommendation.
* Explanation of recommendation (e.g., “Based on current soil conditions, compost is ideal.”).
* Uses trained ML model (Random Forest)
* Option to save or export the recommendation
* Option to refresh data
* Back Button
* Logout Button
