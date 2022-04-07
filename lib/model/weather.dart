import 'package:stacked_weather_app/model/location_model.dart';


class Weather {
  final double temp;
  final int humidity;
  final String name;
  final LocationModel location;
  final WeatherData data;

  Weather({
    required this.temp,
    required this.humidity,
    required this.name,
    required this.location,
    required this.data,
  });

  @override
  String toString() =>
      'name: $name\ntemp: $temp\nhumidity: $humidity\n${location.toString()}\n${data.toString()}\n';

  int get temperature {
    return (temp - 273).toInt();
  }


  factory Weather.fomMap(Map<String, dynamic> json) => _weatherFromMap(json);
}

Weather _weatherFromMap(Map<String, dynamic> json) {
  double temp = json['main']['temp'];
  int humidity = json['main']['humidity'];
  String name = json['name'];
  LocationModel location = LocationModel.fromMap(json['coord']);
  WeatherData data = WeatherData.fromMap(json['weather'][0]);

  return Weather(
    temp: temp,
    humidity: humidity,
    name: name,
    location: location,
    data: data,
  );
}

class WeatherData {
  final String main;
  final String description;

  WeatherData({
    required this.main,
    required this.description,
  });

  @override
  String toString() => 'main: $main\ndescription: $description';

  factory WeatherData.fromMap(Map<String, dynamic> json) =>
      _weatherDataFromMap(json);
}

_weatherDataFromMap(Map<String, dynamic> json) {
  return WeatherData(
    main: json['main'],
    description: json['description'],
  );
}
