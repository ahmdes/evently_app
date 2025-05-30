import 'package:evently_project/core/resources/assets_manager.dart';
import 'package:evently_project/presentation/create_event/components/custom_create_event.dart';
import 'package:flutter/material.dart';
class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Event"),
      ),
      body: CustomCreateEvent(image:AssetsManager.sport,),
    );
  }
}
