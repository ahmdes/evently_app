import 'package:evently_project/core/models/user_dm.dart';
import 'package:evently_project/core/resources/assets_manager.dart';
import 'package:evently_project/presentation/models/event_d_m.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../firebase_service/firebase_service.dart';

class ConfigProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  Locale currentLanguage = Locale("en");
  UserDM? currentUser = UserDM(id: "", name: "", email: "", favoriteEvents: [], );
  LatLng currentLocation = LatLng(37.43296265331129, -122.08832357078792);
  List<EventDM>favoriteEvents=[];
  String markerTitle = "Hello";
  void Function(LatLng)? onMapClicked;

  void configTheme(ThemeMode newTheme) {
    if (newTheme != currentTheme) {
      currentTheme = newTheme;
    }
    notifyListeners();
  }

  void configLanguage(Locale newLang) {
    if (newLang != currentLanguage) {
      currentLanguage = newLang;
    }
    notifyListeners();
  }

  void updateHowe() {
    notifyListeners();
  }

  void updateUserInfo(UserDM user) {
    currentUser = user;
    notifyListeners();
  }
  getFavoriteUpdates(BuildContext context) async {
   favoriteEvents = await FirebaseService.getFavoriteEvents(context);
  notifyListeners();
  }


  Location location = Location();
  String locationMessage = "check location";

  Future<void> getLocation() async {
    bool isPermissionEnabled = await checkPermissionEnabled();
    if (!isPermissionEnabled) {
      locationMessage = "permission is not enabled";
      notifyListeners();
      return;
    }

    bool isServiceEnabled = await checkServiceEnabled();
    if (!isServiceEnabled) {
      locationMessage = "service is not enabled";
      notifyListeners();
      return;
    }

    LocationData getLocation = await location.getLocation();
    goToLocation(
      LatLng(getLocation.latitude ?? 0, getLocation.longitude ?? 0),
    );
    notifyListeners();
  }

  Future<bool> checkPermissionEnabled() async {
    PermissionStatus isPermissionEnabled = await location.hasPermission();
    if (isPermissionEnabled == PermissionStatus.denied) {
      isPermissionEnabled = await location.requestPermission();
    }
    return isPermissionEnabled == PermissionStatus.granted;
  }

  Future<bool> checkServiceEnabled() async {
    bool isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
    }
    return isServiceEnabled;
  }

  GoogleMapController? mapController;

  GoogleMap getMap() {
    return GoogleMap(
      onMapCreated: (controller) {
        mapController = controller;
        notifyListeners();
      },
      initialCameraPosition: CameraPosition(
        target: currentLocation,
        tilt: 59.440717697143555,
        zoom: 19.151926040649414,
      ),
      markers: getMarker(currentLocation),
    );
  }

  Set<Marker> getMarker(LatLng markerLocation) {
    return {
      Marker(
        markerId: MarkerId("1"),
        position: markerLocation,
        infoWindow: InfoWindow(title: markerTitle),
      ),
    };
  }

  Future<void> goToLocation(LatLng location) async {
    if (mapController != null) {
      await mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: location,
            tilt: 59.440717697143555,
            zoom: 5,
          ),
        ),
      );
      currentLocation = location;
      notifyListeners();
    }
  }

  String updateMarkerTitle(String newTitle) {
    markerTitle = newTitle;
    notifyListeners();
    return markerTitle;
  }

}
