

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wheater_app/providers/weather_provider.dart';
import 'package:wheater_app/screens/weather_info.dart';

class WeatherScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  Color _getBackgroundColor(String description) {
  if (description.contains('clear')) {
    return Color(0xFF5EA1FF); 
  } else if (description.contains('clouds')) {
    return Color(0xFFA6C4DA); 
  } else if (description.contains('rain')) {
    return Color(0xFF4D72B6); 
  } else {
    return Color(0xFF33AADD); 
  }
}


  @override
Widget build(BuildContext context) {
  final weatherProvider = Provider.of<WeatherProvider>(context);
  Color backgroundColor;

  if (weatherProvider.weather != null) {
    backgroundColor = _getBackgroundColor(weatherProvider.weather!.description.toLowerCase());
  } else {
    backgroundColor = Color(0xFF33AADD); 
  }

  return Scaffold(
    body: Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            backgroundColor,
            backgroundColor.withOpacity(0.8),
            backgroundColor.withOpacity(0.6),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter city name',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                  ),
                  fillColor: Color(0xFF104084).withOpacity(0.4),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search, color: Colors.white),
                    onPressed: () {
                      weatherProvider.fetchWeather(_controller.text);
                    },
                  ),
                ),
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                  ),
              ),
              SizedBox(height: 20),
              weatherProvider.weather != null
                  ? WeatherInfo(weather: weatherProvider.weather!)
                  : Center(
                      child: Text(
                        'No data available',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ), 
                      ),
                    ),
            ],
          ),
        ),
      ),
    ),
  );
}
}
