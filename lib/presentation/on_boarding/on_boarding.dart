import 'package:evently_project/Provider/config_provider.dart';
import 'package:evently_project/core/resources/assets_manager.dart';
import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/core/routes/routes_manager.dart';
import 'package:evently_project/presentation/components/buildElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
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
  late ConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider =Provider.of<ConfigProvider>(context);
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.only(
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
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(AssetsManager.beingCreative),
            SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.on_boarding_start_title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.on_boarding_start_subject,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.theme,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Spacer(),
                SizedBox(
                  height: 40.h,
                  width: 75.w,
                  child: AnimatedToggleSwitch<ThemeOption>.dual(
                    current: selectedTheme,
                    first: ThemeOption.light,
                    second: ThemeOption.dark,
                    onChanged: (value) {
                      if(value==ThemeOption.light) {
                        provider.configTheme(ThemeMode.light);
                        selectedTheme=ThemeOption.light;
                      } else {
                        provider.configTheme(ThemeMode.dark);
                        selectedTheme=ThemeOption.dark;
                      }
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
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.language,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Spacer(),
                SizedBox(
                  height: 40.h,
                  width: 75.w,
                  child: AnimatedToggleSwitch<CountryOption>.dual(
                    current: selectedCountry,
                    first: CountryOption.egypt,
                    second: CountryOption.america,
                    onChanged: (value) {
                      if(value==CountryOption.egypt) {
                        provider.configLanguage(Locale("ar"));
                        selectedCountry=CountryOption.egypt;
                      } else {
                        provider.configLanguage(Locale("en"));
                        selectedCountry=CountryOption.america;
                      }
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
            SizedBox(
              height: 10,
            ),
            BuildElevatedButton(
              nameOfButton: AppLocalizations.of(context)!.lets_start,
              onClicked: () {
                Navigator.pushNamed(context, RoutesManager.onBoardingStart);
              },
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
