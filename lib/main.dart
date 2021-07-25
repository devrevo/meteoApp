import 'package:flutter/material.dart';
import 'package:meteo_app/Data/weather_data.dart';
import 'package:meteo_app/Pages/meteo_pages.dart';
import 'package:meteo_app/Pages/weather_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Meteos>(
          create: (data) {
            return Meteos();
          },
        ),
      ],
      child: MaterialApp(
        home: MeteoPage(),
        routes: {
          WeatherPage.routeName: (context) => WeatherPage(),
        },
      ),
    );
  }
}
