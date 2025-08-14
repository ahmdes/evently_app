import 'package:evently_project/presentation/edit_event/components/custom_editEvent.dart';
import 'package:evently_project/presentation/models/event_d_m.dart';
import 'package:flutter/material.dart';

class EditEvent extends StatelessWidget {
  const EditEvent({super.key, required this.eventDM});
  final EventDM eventDM;
  @override
  Widget build(BuildContext context) {
         return Scaffold(
      appBar: AppBar(
        title: Text("Edit Event"),
      ),
      body: CustomEditEvent(eventDM: eventDM,),
    );
  }
}
