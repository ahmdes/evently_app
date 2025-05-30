import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/resources/colors_manager.dart';

class BuildElevatedButton extends StatelessWidget {
  const BuildElevatedButton({
    super.key,
    required this.nameOfButton,
    required this.onClicked,
    required this.backGroundColor,
  });
  final VoidCallback onClicked;
  final String nameOfButton;
  final Color backGroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(361.w, 57.h),
        backgroundColor: backGroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: ColorsManager.transparent,
            width: 2.w,
          ),
        ),
      ),
      child: Text(
        nameOfButton,
        style: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: ColorsManager.light,
        ),
      ),
    );
  }
}
