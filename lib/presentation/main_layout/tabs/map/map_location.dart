import 'package:flutter/material.dart';
import '../../../../core/resources/colors_manager.dart';
class MapLocation extends StatelessWidget {
  const MapLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.light,
      ),
      child: Center(
        child: Text(
          "Map",
        ),
      ),
    );
  }
}
