import 'package:http/http.dart' show Client;
import 'package:weatherapps/model/WeatherData.dart';

class MapApi {
  static const _apiKey = '';
  static const _endPoint = '';
  double? lat, lon; // latitude and longitude
  Client client = Client();

  static MapApi? _instance;
  static MapApi? getInstance() => _instance ??= MapApi();
}
