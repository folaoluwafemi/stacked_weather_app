import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_weather_app/services/api_service/api_service.dart';
import 'package:stacked_weather_app/services/api_service/http_service.dart';
import 'package:stacked_weather_app/services/location_service/geo_locator_service.dart';
import 'package:stacked_weather_app/services/location_service/locator_service.dart';
import 'package:stacked_weather_app/ui/home_view/home_view.dart';

import '../ui/city_screen/city_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: CityView),
  ],
  dependencies: [
    LazySingleton(classType: HttpService, asType: ApiService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
  ],
  logger: StackedLogger(),
)
class AppSetup {}
