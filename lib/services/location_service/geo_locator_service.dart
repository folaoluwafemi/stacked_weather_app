import 'package:geolocator/geolocator.dart';
import 'package:stacked_weather_app/model/location_model.dart';
import 'package:stacked_weather_app/services/location_service/locator_service.dart';

class GeolocatorService implements LocationService {
  @override
  Future<void> checkPermission() async {
    bool isLocatorEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    if (!isLocatorEnabled) {
      return Future.error(
          'location service not enabled: ${StackTrace.current}');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('permission was denied', StackTrace.current);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('permission has been denied forever');
    }

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return;
    }
  }

  @override
  Future<LocationModel> getCurrentLocation() async {
    checkPermission().onError((error, stackTrace) {
      return Future.error(error.toString(), stackTrace);
    });


    Position currentLocation = await Geolocator.getCurrentPosition();
    return LocationModel(lat: currentLocation.latitude, long: currentLocation.longitude);

  }
}
