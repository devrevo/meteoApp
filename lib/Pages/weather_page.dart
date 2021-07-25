import 'package:flutter/material.dart';
import 'package:meteo_app/Classes/openweather.dart';
import 'package:meteo_app/Data/weather_data.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WeatherPage extends StatefulWidget {
  static const String routeName = "/weather-page";
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ignore: omit_local_variable_types
    OpenWeather weather = OpenWeather(
      id: 0,
      name: "Viii",
      coord: new Coord(lat: 200.0, lon: 200.0),
      wind: new Wind(deg: 12, speed: 3.0),
    );
    final route = ModalRoute.of(context);
    if (route == null) return SizedBox.shrink();
    final weatherId = route.settings.arguments;
    Provider.of<Meteos>(context).data.forEach(
      (element) {
        if (element.id == weatherId) weather = element;
      },
    );
    late GoogleMapController mapController;

    final LatLng _center = LatLng(weather.coord.lat, weather.coord.lon);

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(weather.name),
      ),
      body: Container(
        height: size.height * 0.9,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                weather.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Degree : " + weather.wind.deg.toString()),
                    Text("Speed : " + weather.wind.speed.toString()),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Longtitude : " + weather.coord.lon.toString()),
                    Text("Latitude : " + weather.coord.lat.toString()),
                  ],
                )
              ],
            ),
            
              GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              ),
        
          ],
        ),
      ),
    );
  }
}
