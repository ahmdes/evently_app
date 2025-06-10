import 'package:evently_project/core/resources/assets_manager.dart';
import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/core/routes/routes_manager.dart';
import 'package:evently_project/presentation/components/buildElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
enum CountryOption { egypt, america }
enum ThemeOption { light, dark }
class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  CountryOption selectedCountry = CountryOption.egypt;
  ThemeOption selectedTheme = ThemeOption.light;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  REdgeInsets.only(
          left: 10.0,
          right: 10,
          top: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: SizedBox(
              height: 120.h,
              width: 120.w,
              child: Image.asset(AssetsManager.eventlyLogo),
            ),),
            SizedBox(height:10,),
            Image.asset(AssetsManager.beingCreative),
            SizedBox(height:10,),
            Text(
              "Personalize Your Experience",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height:10,),
            Expanded(
              child: Text(
                "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            SizedBox(height:10,),
            Row(
              children: [
                Text(
                  "Theme",
                  style: Theme.of(context).textTheme.displaySmall,),
                Spacer(),
                SizedBox(
                  height: 40.h,
                  width: 75.w,
                  child: AnimatedToggleSwitch<ThemeOption>.dual(
                    current: selectedTheme,
                    first: ThemeOption.light,
                    second: ThemeOption.dark,
                    onChanged: (value) {
                      setState(() {
                        selectedTheme = value;
                      });
                    },
                    iconBuilder: (value) => Image.asset(
                      value == ThemeOption.light
                          ? AssetsManager.sun
                          : AssetsManager.moon,
                      width: 24.w,
                      height: 24.h,
                      color: ColorsManager.light,
                    ),
                    style: ToggleStyle(
                      indicatorColor: ColorsManager.blue,
                      borderColor: ColorsManager.blue,
                      borderRadius: BorderRadius.circular(30.r),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height:10,),
            Row(
              children: [
                Text(
                  "Language",
              style: Theme.of(context).textTheme.displaySmall,),
                Spacer(),
                SizedBox(
                  height: 40.h,
                  width: 75.w,
                  child: AnimatedToggleSwitch<CountryOption>.dual(
                    current: selectedCountry,
                    first: CountryOption.egypt,
                    second: CountryOption.america,
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value;
                      });
                    },
                    iconBuilder: (value) => Image.asset(
                      value == CountryOption.egypt
                          ? AssetsManager.egypt
                          : AssetsManager.america,
                      width: 24.w,
                      height: 24.h,
                    ),
                    style: ToggleStyle(
                      indicatorColor: ColorsManager.blue,
                      borderColor: ColorsManager.blue,
                      borderRadius: BorderRadius.circular(30.r),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height:10,),
            BuildElevatedButton(nameOfButton: "Let's Start", onClicked: (){
              Navigator.pushNamed(context, RoutesManager.onBoardingStart);
            },),
            SizedBox(height:10,),
          ],
        ),
      ),
    );
  }
}
