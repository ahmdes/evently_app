import 'package:evently_project/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/colors_manager.dart';
class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forget Password",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,),
        child: SizedBox(
          width: 361,
          height: 441,
          child: Column(
            children: [
              Image.asset(AssetsManager.resetPassword,),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(361, 57),
                  backgroundColor: ColorsManager.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: ColorsManager.blue,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  "Reset Password",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.light,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
