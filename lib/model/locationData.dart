class LocationData {
  final double? lat;
  final double? lon;

  LocationData({
    this.lat,
    this.lon,
  });

  static LocationData locationItems(Map<String, double> json) {
    double? lat = json['lat'];
    double? lon = json['lon'];

    return LocationData(
      lat: lat,
      lon: lon,
    );
  }
}
