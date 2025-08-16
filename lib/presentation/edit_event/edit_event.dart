import 'package:evently_project/presentation/edit_event/components/custom_editEvent.dart';
import 'package:evently_project/presentation/models/event_d_m.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class EditEvent extends StatelessWidget {
  const EditEvent({super.key, required this.eventDM});
  final EventDM eventDM;
  @override
  Widget build(BuildContext context) {
         return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.edit_event),
      ),
      body: CustomEditEvent(eventDM: eventDM,),
    );
  }
}
