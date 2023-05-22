import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scoped_model/scoped_model.dart';


mixin MapController on Model {


  bool _isMapLoading = false;
  bool get isMapLoading => _isMapLoading;

  bool _isMapDone = true;
  bool get isMapDone => _isMapDone;

  LatLng _userLocation = LatLng(30.0444, 31.2357);
  LatLng get userLocation => _userLocation;


  Future<void> getUserLocation() async {

    _isMapLoading = true;
    notifyListeners();

    bool isMapOk = await checkMapStatus();
    if (isMapOk) {
      try {
       Position userPosition = await Geolocator.getCurrentPosition();
        _userLocation = LatLng(userPosition.latitude, userPosition.longitude);
      } catch (e) {
        _isMapDone = false;
        _isMapLoading = false;
        notifyListeners();
      }
    } else {
      _isMapDone = false;
    }

    _isMapLoading = false;
    notifyListeners();
  }


  Future<bool> checkMapStatus() async {

    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied || locationPermission == LocationPermission.deniedForever) {
      Geolocator.requestPermission();
    }

    bool locationService = await Geolocator.isLocationServiceEnabled();

    return locationService;
  }
}