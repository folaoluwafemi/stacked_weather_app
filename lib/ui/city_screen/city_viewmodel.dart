import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_weather_app/app/app.locator.dart';
import 'package:stacked_weather_app/app/app.logger.dart';
import 'package:stacked_weather_app/utils/failure.dart';

class CityViewModel extends BaseViewModel {
  final navigator = locator<NavigationService>();
  final _log = getLogger('CityViewModel');

  String _cityValue = '';

  void goBack() => navigator.back();

  void onCityTextChanged(String value) {
    try {
      _cityValue = value;
      _log.d(_cityValue.toString());
      notifyListeners();
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  void onDoneButtonPressed() {
    navigator.back(result: _cityValue);
  }
}
