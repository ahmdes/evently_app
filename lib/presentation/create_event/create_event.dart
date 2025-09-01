import 'package:evently_project/presentation/create_event/components/custom_create_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.create_event),
      ),
      body: CustomCreateEvent(),
    );
  }
}
