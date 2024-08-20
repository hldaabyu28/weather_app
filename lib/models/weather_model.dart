import 'package:intl/intl.dart';
class Weather {
  final String cityName;
  final double temperature;
  final String description;
  final String icon;
  final List<WeatherForecast> forecast;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.icon,
    required this.forecast,
  });

  factory Weather.fromJson(Map<String, dynamic> data) {
    final cityName = data['city']['name'];
    final currentWeather = data['list'][0];
    final currentTemp = double.parse(currentWeather['main']['temp'].toString());
    final currentDescription = currentWeather['weather'][0]['description'];
    final currentIcon = currentWeather['weather'][0]['icon'];

    final List<WeatherForecast> forecast = [];
    for (var i = 1; i <= 3; i++) {
      final forecastData = data['list'][i * 8]; 
      final date = forecastData['dt_txt'];
      final temp = double.parse(forecastData['main']['temp'].toString());
      final description = forecastData['weather'][0]['description'];
      final icon = forecastData['weather'][0]['icon'];

      forecast.add(WeatherForecast(
        date: date,
        temperature: temp,
        description: description,
        icon: icon,
      ));
    }

    return Weather(
      cityName: cityName,
      temperature: currentTemp,
      description: currentDescription,
      icon: currentIcon,
      forecast: forecast,
    );
  }

 String get formattedTemperature {
    double tempInCelsius = temperature - 273.15;
    return '${tempInCelsius.toStringAsFixed(0)}°C';
  }
}

class WeatherForecast {
  final String date;
  final double temperature;
  final String description;
  final String icon;

  WeatherForecast({
    required this.date,
    required this.temperature,
    required this.description,
    required this.icon,
  });

  String get formattedDay {
    DateTime parsedDate = DateTime.parse(date);
    return DateFormat('EEEE').format(parsedDate); 
  }

  

  String get formattedTemperature {
    double tempInCelsius = temperature - 273.15;
    return '${tempInCelsius.toStringAsFixed(0)}°C';
  }
}
