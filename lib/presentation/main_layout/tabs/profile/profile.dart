import 'package:evently_project/core/resources/assets_manager.dart';
import 'package:evently_project/presentation/components/buildElevatedButton.dart';
import 'package:evently_project/presentation/components/build_text_fields.dart';
import 'package:evently_project/presentation/models/text_field_dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/colors_manager.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorsManager.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  64.r,
                ),
              ),
            ),
            child: Padding(
              padding: REdgeInsets.only(
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        24.r,
                      ),
                      topRight: Radius.circular(
                        1000.r,
                      ),
                      bottomRight: Radius.circular(
                        1000.r,
                      ),
                      bottomLeft: Radius.circular(
                        1000.r,
                      ),
                    ),
                    child: SizedBox(
                      height: 120.h,
                      width: 120.w,
                      child: Image.asset(
                        AssetsManager.routeImage,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Safwat",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 24.sp,
                          color: ColorsManager.light,
                        ),
                      ),
                      Text(
                        "johnsafwat.route@gmail\n.com",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: ColorsManager.light,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: REdgeInsets.all(20),
            child: SizedBox(
              height: 220,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Language",
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.dark,
                    ),
                  ),
                  BuildTextFields(
                    textFieldDM: TextFieldDM(
                      prefixIcon: null,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_drop_down),
                      ),
                      hintText: "Arabic",
                      obsecureText: false,
                      heightOfTextField: 0,
                    ),
                  ),
                  Text(
                    "Theme",
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.dark,
                    ),
                  ),
                  BuildTextFields(
                    textFieldDM: TextFieldDM(
                      prefixIcon: null,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_drop_down),
                      ),
                      hintText: "Light",
                      obsecureText: false,
                      heightOfTextField: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(flex: 8,),
          Padding(
            padding:  REdgeInsets.all(20.0),
            child: BuildElevatedButton(
              
              nameOfButton: "Logout",
              onClicked: () {}, backGroundColor: ColorsManager.lightRed,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
