import 'package:evently_project/presentation/models/button_of_events_dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/resources/colors_manager.dart';

class ButtonOfEvents extends StatelessWidget {
  const ButtonOfEvents({
    super.key,
    required this.buttonOfEventsDM,
    required this.isSelected,
  });
  final ButtonOfEventsDM buttonOfEventsDM;
  final isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:15 ,vertical:10, ),
      decoration: BoxDecoration(
        color: isSelected==true?ColorsManager.light:ColorsManager.transparent,
        borderRadius: BorderRadius.circular(46.r),
        border: Border.all(
          color: ColorsManager.light,
          width: 2,
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(buttonOfEventsDM.image,color: isSelected==true?ColorsManager.blue:ColorsManager.light,),
          SizedBox(
            width: 10,
          ),
          Text(
            buttonOfEventsDM.text,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isSelected==true?ColorsManager.blue:ColorsManager.light,
            ),
          ),
        ],
      ),
    );
  }
}
