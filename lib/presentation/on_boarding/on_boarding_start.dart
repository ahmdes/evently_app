import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/core/routes/routes_manager.dart';
import 'package:evently_project/presentation/on_boarding/components/onBoardingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/resources/assets_manager.dart';
import 'models/on_boarding_dm.dart';

class OnBoardingStart extends StatefulWidget {
  const OnBoardingStart({
    super.key,
  });

  @override
  State<OnBoardingStart> createState() => _OnBoardingStartState();
}

class _OnBoardingStartState extends State<OnBoardingStart> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    List<OnBoardingDM> onBoardingInfo = [
      OnBoardingDM(
        image: AssetsManager.cat,
        title: AppLocalizations.of(context)!.on_boarding_1_title,
        subject:AppLocalizations.of(context)!.on_boarding_1_subject,
      ),
      OnBoardingDM(
        image: AssetsManager.search,
        title: AppLocalizations.of(context)!.on_boarding_2_title,
        subject:AppLocalizations.of(context)!.on_boarding_2_subject,
      ),
      OnBoardingDM(
        image: AssetsManager.social,
        title: AppLocalizations.of(context)!.on_boarding_3_title,
        subject:AppLocalizations.of(context)!.on_boarding_3_subject,
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: REdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: SizedBox(
                  height: 130.h,
                  width: 130.w,
                  child: Image.asset(
                    AssetsManager.eventlyLogo,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: PageView.builder(
                itemBuilder: (BuildContext context, index) {
                  index=currentIndex;
                  return OnBoardingWidget(
                      onBoardingDM: onBoardingInfo[index]);
                },
                itemCount:onBoardingInfo.length,
              ),
            ),
            Row(
              children: [
                if(currentIndex!=0)
                  IconButton(
                    onPressed: () {
                      currentIndex--;
                      setState(() {

                      });
                    },
                    icon: Icon(
                      Icons.arrow_circle_left_outlined,
                      size: 50,
                      color: ColorsManager.blue,
                    ),
                  ),
                Spacer(),
                  IconButton(
                    onPressed: () {
                      if(currentIndex==onBoardingInfo.length-1)
                        {
                          Navigator.pushNamed(context, RoutesManager.signIn);
                        }
                      else {
                        currentIndex++;
                      }
                      setState(() {

                      });
                    },
                    icon: Icon(Icons.arrow_circle_right_outlined,
                        size: 50, color: ColorsManager.blue),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
