import 'package:evently_project/presentation/models/button_of_events_dm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/resources/colors_manager.dart';

class ButtonOfEvents extends StatelessWidget {
  const ButtonOfEvents({
    super.key,
    required this.buttonOfEventsDM,
  });
  final ButtonOfEventsDM buttonOfEventsDM;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8,left: 5,right: 5,),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.light,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(buttonOfEventsDM.image),
            SizedBox(
              width: 10,
            ),
            Text(
              buttonOfEventsDM.text,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: ColorsManager.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
