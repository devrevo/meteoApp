import 'package:flutter/material.dart';
import 'package:meteo_app/Classes/openweather.dart';
import 'package:meteo_app/Pages/weather_page.dart';
import 'package:provider/provider.dart';

class WeatherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weather = Provider.of<OpenWeather>(context);
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(WeatherPage.routeName, arguments: weather.id);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Card(
          color: Colors.blue[200],
          elevation: 5,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            height: size.height * 0.1,
            width: size.width * 0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      weather.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Degree :" + weather.wind.deg.toString()),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Speed :" + weather.wind.speed.toString()),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wb_sunny_sharp,
                      color: Colors.amber[900],
                      size: 80,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
