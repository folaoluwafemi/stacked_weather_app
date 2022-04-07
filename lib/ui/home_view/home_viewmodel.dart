import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_weather_app/app/router/app_router.locator.dart';
import 'package:stacked_weather_app/app/router/app_router.router.dart';
import 'package:stacked_weather_app/services/api_service/api_service.dart';

import '../../model/weather.dart';

class HomeViewModel extends BaseViewModel {
  final navigator = locator<NavigationService>();
  final api = locator<ApiService>();

  late Weather _weather;

  Weather get weather {
    getWeather();
    return _weather;
  }

  void getWeather() async {
    _weather = await api.getWeatherByCity('Akure');
    notifyListeners();
  }

  void goToCity(){
    navigator.navigateTo(Routes.cityView);
  }
}
