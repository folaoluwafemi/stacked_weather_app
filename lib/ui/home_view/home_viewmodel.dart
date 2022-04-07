import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_weather_app/services/api_service/api_service.dart';
import 'package:stacked_weather_app/utils/failure.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../model/weather.dart';

class HomeViewModel extends BaseViewModel {
  String cityName = '';

  final navigator = locator<NavigationService>();
  final api = locator<ApiService>();
  final snackBarService = locator<SnackbarService>();

  late Weather weather;

  void getWeather() async {
    try {
      setBusy(true);
      weather =
          await api.getWeatherByCity(cityName.isEmpty ? 'Akure' : cityName);
      notifyListeners();
    } on Failure catch (e) {
      snackBarService.showSnackbar(message: e.message);
    } finally {
      setBusy(false);
    }
  }

  void goToCity() async {
    try {
      cityName = (await navigator.navigateTo(Routes.cityView)).toString();
      getWeather();
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }
}
