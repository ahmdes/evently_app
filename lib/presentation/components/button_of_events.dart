import 'package:evently_project/presentation/models/button_of_events_dm.dart';
import 'package:evently_project/presentation/models/tab_design_dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonOfEvents extends StatelessWidget {
  const ButtonOfEvents({
    super.key,
    required this.buttonOfEventsDM,
    required this.tabDesignDM,
    required this.isSelected,
  });
  final ButtonOfEventsDM buttonOfEventsDM;
  final TabDesignDM tabDesignDM;
  final isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
          color: isSelected == true
              ? tabDesignDM.selectedTabBG
              : tabDesignDM.unSelectedTabBG,
          borderRadius: BorderRadius.circular(46.r),
          border: Border.all(
            color: tabDesignDM.borderColor,
            width: 2,
          ),),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            buttonOfEventsDM.image,
            color: isSelected == true
                ? tabDesignDM.selectedLabelColor
                : tabDesignDM.unSelectedLabelColor,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            buttonOfEventsDM.text,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isSelected == true
                  ? tabDesignDM.selectedLabelColor
                  : tabDesignDM.unSelectedLabelColor,
            ),
          ),
        ],
      ),
    );
  }
}
