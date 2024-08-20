import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wheater_app/models/weather_model.dart';


class WeatherInfo extends StatelessWidget {
  final Weather weather;

  WeatherInfo({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weather.cityName,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
          ),
        ),
        Gap(10),
        Text(
          weather.formattedTemperature,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 25,
              fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
          ),
        ),
        Image.network('https://openweathermap.org/img/w/${weather.icon}.png', scale: 0.2),
        Text(
          weather.description.characters.first.toUpperCase() + weather.description.substring(1),
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 25,
              fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
          ),
        ),
        SizedBox(height: 20),
        Text(
          '3-Day Forecast',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 25,
              fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
          ),
        ),
        Gap(10),
        ...weather.forecast.map((forecast) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
              color: Color(0xFF104084).withOpacity(0.3), // Latar belakang
              borderRadius: BorderRadius.circular(15), // Radius sudut
            ),
              child: Center(
                child: ListTile(
                  leading: Image.network('https://openweathermap.org/img/w/${forecast.icon}.png'),
                  title: Text('${forecast.temperature.toStringAsFixed(0)}°C',   style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                  ),        
                ),
                  subtitle: Text(forecast.description.characters.first.toUpperCase() + forecast.description.substring(1), style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                  ),),
                  trailing: Text(forecast.formattedDay, style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                  ),),
                ),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}