import 'package:evently_project/Provider/config_provider.dart';
import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/presentation/models/event_d_m.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  late ConfigProvider provider;
  EventDM? eventDM;
  LatLng currentChosenLocation = LatLng(37.43296265331129, -122.08832357078792);
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ConfigProvider>(context);
    return Column(
      children: [
        Expanded(
          flex: 12,
          child: GoogleMap(
              onTap: (LatLng location) {
                currentChosenLocation=location;
                provider.goToLocation(location);
                eventDM?.latitude = location.latitude;
                eventDM?.longitude = location.longitude;
                Navigator.pop(context);
              },
              initialCameraPosition: CameraPosition(
                target:currentChosenLocation,
                tilt: 59.440717697143555,
                zoom: 5,
              ),
              markers: {
                Marker(
                  markerId: MarkerId("1"),
                  position: currentChosenLocation,
                  infoWindow: InfoWindow(title: "Hello"),
                ),
              }),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: ColorsManager.blue,
            alignment: Alignment.center,
            width: double.infinity,
            height: 60,
            child: Text(
              "Tab On Location To Select ",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        )
      ],
    );
  }
  // void onMapClicked(LatLng location)
  // {
  //   provider.newLocation=location;
  //   provider.goToLocation();
  // }
}
