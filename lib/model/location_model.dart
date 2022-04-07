class LocationModel {
  final double lat;
  final double long;

  LocationModel({
    required this.lat,
    required this.long,
  });

  @override
  String toString() {
    return 'lat: $lat\nlong: $long';
  }

  factory LocationModel.fromMap(Map<String, dynamic> json) =>
      _locationFromMap(json);

  Map<String, dynamic> toMap() => _locationToMap(this);
}

dynamic _locationToMap(LocationModel locationModel) {
  return Map<String, dynamic>.from({
    'lat': locationModel.lat,
    'lon': locationModel.long,
  });
}

LocationModel _locationFromMap(Map<String, dynamic> json) {
  double lon = double.parse(json['lon'].toString());
  double lat = double.parse(json['lat'].toString());
  return LocationModel(lat: lat, long: lon);
}
