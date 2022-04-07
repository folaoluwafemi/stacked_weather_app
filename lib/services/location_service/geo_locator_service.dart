// import 'package:location/location.dart';
// import 'package:stacked_weather_app/model/location_model.dart';
// import 'package:stacked_weather_app/services/location_service/locator_service.dart';
//
// class GeolocatorService implements LocationService {
//   final Location location = Location();
//
//   @override
//   Future<void> checkPermission() async {
//     bool isLocatorEnabled = await location.serviceEnabled();
//     PermissionStatus permission;
//
//     permission = await location.hasPermission();
//     await location.requestPermission();
//     if (!isLocatorEnabled) {
//       return Future.error(
//           'location service not enabled: ${StackTrace.current}');
//     }
//     permission = await location.hasPermission();
//     if (permission == PermissionStatus.DENIED) {
//       permission = await location.requestPermission();
//       if (permission == PermissionStatus.DENIED) {
//         return Future.error('permission was denied', StackTrace.current);
//       }
//     }
//
//     if (permission == PermissionStatus.DENIED_FOREVER) {
//       return Future.error('permission has been denied forever');
//     }
//
//     if (permission == PermissionStatus.GRANTED) {
//       return;
//     }
//   }
//
//   @override
//   Future<LocationModel> getCurrentLocation() async {
//     checkPermission().onError((error, stackTrace) {
//       return Future.error(error.toString(), stackTrace);
//     });
//
//     LocationData currentLocation = await location.getLocation();
//
//     return LocationModel(
//         lat: currentLocation.latitude, long: currentLocation.longitude);
//   }
// }
