import 'package:evently_project/Provider/config_provider.dart';
import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/presentation/models/event_d_m.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapEvents extends StatefulWidget {
  const MapEvents({super.key, required this.eventDM});
  final EventDM eventDM;

  @override
  State<MapEvents> createState() => _MapEventsState();
}

class _MapEventsState extends State<MapEvents> {
  late ConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ConfigProvider>(context);
    return InkWell(
      onTap: () {
        provider.goToLocation(
          LatLng(widget.eventDM.latitude, widget.eventDM.longitude),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 130,
          width: 300,
          decoration: BoxDecoration(
            color: ColorsManager.light,
            border: Border.all(
              color: ColorsManager.blue,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 2,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(widget.eventDM.bgImage))),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        maxLines: 1,
                        widget.eventDM.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: ColorsManager.blue,
                        ),
                      ),
                      Text(
                        maxLines: 1,
                        widget.eventDM.description,
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                          color: ColorsManager.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        maxLines: 1,
                        "${widget.eventDM.latitude}",
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                          color: ColorsManager.blue,
                        ),
                      ),
                      Text(
                        maxLines: 1,
                        "${widget.eventDM.longitude}",
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                          color: ColorsManager.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
