// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class WeatherScreen extends StatelessWidget {
//   const WeatherScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: const [
//               Color(0xFF29B2DD),
//               Color(0xFF33AADD),
//               Color(0xFF2DC8EA),
//             ],
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image(
//                 image: AssetImage(
//                   'assets/Sun cloud angled rain.png',
//                 ),
//                 width: 300,
//                 height: 300,
//               ),
//               Text(
//                 '32°C',
//                 style: GoogleFonts.plusJakartaSans(
//                   fontSize: 80,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               Text(
//                 'Sunny',
//                 style: GoogleFonts.plusJakartaSans(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           )

//         ),
//         ),
//       );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wheater_app/providers/weather_provider.dart';
import 'package:wheater_app/screens/weather_info.dart';

class WeatherScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [
              Color(0xFF29B2DD),
              Color(0xFF33AADD),
              Color(0xFF2DC8EA),
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
                          ), // Replace GoogleFonts with a valid TextStyle object
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
