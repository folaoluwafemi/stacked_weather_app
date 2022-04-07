import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:stacked_weather_app/app/app.logger.dart';
import 'package:stacked_weather_app/model/location_model.dart';
import 'package:stacked_weather_app/model/weather.dart';
import 'package:stacked_weather_app/services/api_service/api_service.dart';
import 'package:stacked_weather_app/utils/failure.dart';

const String authority = 'api.openweathermap.org';
const String unencodedPath = 'data/2.5/weather';
const String rand = '/data/2.5/weather?q={city name}&appid={API key}';
const String _apiKey = '421c144f1b0e8be2ba9c473f05cde42a';

class HttpService implements ApiService {
  Client client = Client();
  final _log = getLogger('HttpService');

  @override
  getWeatherByLocation(LocationModel location) async {
    try {
      Uri url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.long}&appid=$_apiKey');
      Response response = await client.get(url);

      if (response.statusCode != 200) {
        throw Failure(message: 'Unable to fetch data');
      }


      _log.d(response.body);

      Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;

      Weather weather = Weather.fomMap(json);
      _log.d('calling function');
      return weather;



    } on SocketException {
      throw Failure(message: 'You are not connected to the internet');
    } on FormatException {
      throw Failure(message: 'Something went wrong');
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  getWeatherByCity(String city) async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey');
    Response response = await client.get(url);

    if (response.statusCode != 200) {
      return Future.error(
          'an error occurred, unable to fetch data: ${StackTrace.current}');
    }

    Map<String, dynamic> json =
        jsonDecode(response.body) as Map<String, dynamic>;

    Weather weather = Weather.fomMap(json);
    return weather;
  }
}
