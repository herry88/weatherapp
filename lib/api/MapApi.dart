import 'package:http/http.dart' show Client;
import 'package:weatherapps/model/WeatherData.dart';

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
  }
}
