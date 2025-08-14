import 'package:evently_project/Provider/config_provider.dart';
import 'package:evently_project/presentation/main_layout/tabs/map/components/map_events.dart';
import 'package:evently_project/presentation/models/category_d_m.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/constant_manager.dart';
import '../../../../firebase_service/firebase_service.dart';
import '../../../models/event_d_m.dart';

class MapLocation extends StatefulWidget {
  const MapLocation({super.key});

  @override
  State<MapLocation> createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  late ConfigProvider provider;
  CategoryDM selectedCategory = ConstantManager.categories[0];
  EventDM? eventDM;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ConfigProvider>(context);
    return Consumer<ConfigProvider>(
      builder: (BuildContext context, ConfigProvider value, Widget? child) {
        return Stack(children: [
          value.getMap(),
          Positioned(
            bottom: 30,
            height: 150,
            width: 350,
            child: StreamBuilder(
              stream:
                  FirebaseService.getEventsRealTimeUpdates(selectedCategory),
              builder: (context, snapShot) {
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return (Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.blue,
                    ),
                  ));
                } else if (snapShot.hasError) {
                  return (Text("Error"));
                } else {
                  List<EventDM> events = snapShot.data ?? [];
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return MapEvents(
                        eventDM: events[index],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ]);
      },
    );
  }

  void onMapEventClicked() {
    provider.goToLocation(provider.currentLocation);
  }
}
