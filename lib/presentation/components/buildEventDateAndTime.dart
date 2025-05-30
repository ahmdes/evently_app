import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/presentation/models/buildEventDateAndTimeDM.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildEventDateAndTime extends StatelessWidget {
  const BuildEventDateAndTime({
    super.key,
    required this.buildEventDateAndTimeDM,
  });
  final BuildEventDateAndTimeDM buildEventDateAndTimeDM;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        buildEventDateAndTimeDM.icon,
        Spacer(),
        Text(
          buildEventDateAndTimeDM.nameOfEvent,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: ColorsManager.dark,
          ),
        ),
        Spacer(flex:10,),
        Text(
          buildEventDateAndTimeDM.nameOfChosenEvent,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: ColorsManager.blue,
          ),
        ),

      ],
    );
  }
}
