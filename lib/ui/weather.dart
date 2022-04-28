import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as Client;
// import 'package:weatherapps/model/WeatherData.dart';

class WeatherData {
  final String name;
  final double temp;
  final String main;
  final String icon;

  WeatherData(
      {required this.name,
      required this.temp,
      required this.main,
      required this.icon});

  static WeatherData deserialize(String json) {
    JsonDecoder decoder =const  JsonDecoder();
    var map = decoder.convert(json);

    String name = map['name'];
    double temp = map['main']['temp'].toDouble();
    String main = map['weather'][0]['main'];
    String icon = map['weather'][0]['icon'];

    return WeatherData(name: name, temp: temp, main: main, icon: icon);
  }
}

class MapApi {
  static const _apiKey = '2fb805eed9f39fdad709f873f7a44f25';
  static const _endPoint = 'https://api.openweathermap.org/data/2.5';
  double? lat, lon; // latitude and longitude
  Client client = Client();

  static MapApi? _instance;
  static MapApi? getInstance() => _instance ??= MapApi();

  String _apiCall({double? lat, double? lon}) {
    return _endPoint +
        "/weather?lat=" +
        lat.toString() +
        "&lon=" +
        lon.toString() +
        "&APPID=" +
        _apiKey +
        "&units=metric";
  }

  // get weather data
  getWeatherData({double? lat, double? lon}) async {
    var response =
        await client.get(Uri.parse(_apiCall(lat: lat, lon: lon)), headers: {
      'Accept': 'application/json',
    });
    return WeatherData.deserialize(json.decode(response.body));
  }
}

class Weather extends StatelessWidget {
  final WeatherData weatherData;
  Weather({Key? key, required this.weatherData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(60.0),
      child: Column(
        children: [
          dateSection,
          tempSection,
          const SizedBox(
            height: 20.0,
          ),
          descSection,
        ],
      ),
    );
  }

  Widget dateSection = Container(
    child: Text(
      DateFormat('MMMM d, H:mm').format(DateTime.now()),
      style: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );

  //tempSection
  Widget tempSection = Container(
    padding: const EdgeInsets.symmetric(
      vertical: 10.0,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          weatherData.temp.toStringAsFixed(0) + "°C",
          style: TextStyle(
            fontSize: 80.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
              top: 12.0,
            ),
            margin: EdgeInsets.only(
              left: 6.0,
            ),
            child: Text(
              '\u2103',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Image.asset(
          'assets/img/cloudy.png',
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
      ],
    ),
  );

  Widget descSection = Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Bekasi',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          'Cloudy',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}
