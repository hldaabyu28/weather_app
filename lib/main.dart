import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheater_app/providers/weather_provider.dart';
import 'package:wheater_app/screens/weather_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
      ],
      child: MaterialApp(
        home: WeatherScreen(),
      ),
    );
  }
}
