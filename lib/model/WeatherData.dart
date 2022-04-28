import 'dart:convert';

class WeatherModel {
  final String name;
  final double temp;
  final String main;
  final String icon;

  WeatherModel({
    required this.name,
    required this.temp,
    required this.main,
    required this.icon,
  });

  static WeatherModel deserialize(String json) {
    JsonDecoder decoder = const JsonDecoder();
    var map = decoder.convert(json);

    String name = map['name'];
    double temp = map['main']['temp'].toDouble();
    String main = map['weather'][0]['main'];
    String icon = map['weather'][0]['icon'];

    return WeatherModel(
      name: name,
      temp: temp,
      main: main,
      icon: icon,
    );
  }
}
