import 'package:flutter/material.dart';
import 'package:meteo_app/Classes/openweather.dart';
import 'package:meteo_app/Data/weather_data.dart';
import 'package:meteo_app/Widgets/weather_widget.dart';
import 'package:provider/provider.dart';

class MeteoPage extends StatefulWidget {
  @override
  _MeteoPageState createState() => _MeteoPageState();
}

class _MeteoPageState extends State<MeteoPage> {
  List<OpenWeather> weathers = [];
  @override
  void didChangeDependencies() {
    Provider.of<Meteos>(context).fetchData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    weathers = Provider.of<Meteos>(context).data;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Meteo'),
      ),
      body: Container(
        width: size.width / 0.7,
        height: size.height / 0.7,
        child: ListView.builder(
          itemCount: weathers.length,
          itemBuilder: (context, index) {
            return ChangeNotifierProvider.value(
              value: weathers[index],
              child: WeatherWidget(),
            );
          },
        ),
      ),
    );
  }
}
