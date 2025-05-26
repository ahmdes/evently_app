import 'package:flutter/material.dart';
import '../../../../core/resources/constant_manager.dart';
import '../../../components/event.dart';

class Love extends StatefulWidget {
  const Love({super.key});

  @override
  State<Love> createState() => _LoveState();
}
class _LoveState extends State<Love> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Event(eventDM: ConstantManager.favoriteEvents[index]);
        },
        itemCount: ConstantManager.favoriteEvents.length,
      ),
    );
  }
}
