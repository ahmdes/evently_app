import 'package:evently_project/presentation/models/buildEventDateAndTimeDM.dart';
import 'package:flutter/material.dart';

class BuildEventDateAndTime extends StatelessWidget {
  const BuildEventDateAndTime({
    super.key,
    required this.buildEventDateAndTimeDM,
    required this.onClicked,
  });
  final BuildEventDateAndTimeDM buildEventDateAndTimeDM;
  final void Function() onClicked;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildEventDateAndTimeDM.icon,
        Spacer(),
        Text(
          buildEventDateAndTimeDM.nameOfEvent,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Spacer(flex:10,),
        GestureDetector(
          onTap: onClicked,
          child: Text(
            buildEventDateAndTimeDM.nameOfChosenEvent,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),

      ],
    );
  }
}
