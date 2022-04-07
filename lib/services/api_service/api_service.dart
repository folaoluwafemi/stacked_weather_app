import 'package:stacked_weather_app/model/location_model.dart';



abstract class ApiService {
  dynamic getWeatherByCity(String city);
  dynamic getWeatherByLocation(LocationModel location);
}
