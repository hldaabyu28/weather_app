// lib/providers/weather_provider.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherProvider with ChangeNotifier {
  Weather? _weather;

  Weather? get weather => _weather;

  Future<void> fetchWeather(String cityName) async {
    final apiKey = 'f2bcfd79137c0b070e356dffb97485a7';  
    final url = 'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _weather = Weather.fromJson(data);
        notifyListeners();
        print(response.body);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (error) {
      
    }
  }
}
