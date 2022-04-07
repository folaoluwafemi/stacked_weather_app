import 'dart:convert';

import 'package:http/http.dart';
import 'package:stacked_weather_app/model/location_model.dart';
import 'package:stacked_weather_app/model/weather.dart';
import 'package:stacked_weather_app/services/api_service/api_service.dart';

const String authority = 'api.openweathermap.org';
const String unencodedPath = 'data/2.5/weather';
const String rand = '/data/2.5/weather?q={city name}&appid={API key}';
const String _API_KEY = '421c144f1b0e8be2ba9c473f05cde42a';

class HttpService implements ApiService {
  Client client = Client();

  @override
  getWeatherByLocation(LocationModel location) async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.long}&appid=$_API_KEY');
    Response response = await client.get(url);

    if (response.statusCode != 200) {
      print(response.body);
      return Future.error(
          'an error occurred, unable to fetch data: ${StackTrace.current}');
    }

    Map<String, dynamic> json =
        jsonDecode(response.body) as Map<String, dynamic>;

    Weather weather = Weather.fomMap(json);
    print(weather);

    return weather;
  }

  @override
  getWeatherByCity(String city) async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_API_KEY');
    Response response = await client.get(url);

    if (response.statusCode != 200) {
      print(response.body);
      return Future.error(
          'an error occured, unable to fetch data: ${StackTrace.current}');
    }

    Map<String, dynamic> json =
        jsonDecode(response.body) as Map<String, dynamic>;

    Weather weather = Weather.fomMap(json);
    print(weather);
    return weather;
  }
}
