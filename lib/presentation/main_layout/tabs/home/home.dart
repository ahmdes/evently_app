import 'package:evently_project/Provider/config_provider.dart';
import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/core/resources/constant_manager.dart';
import 'package:evently_project/presentation/components/event.dart';
import 'package:evently_project/presentation/models/tab_design_dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../components/custom_tab_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   IconData theme=Icons.dark_mode_outlined;
  String language="EN";
  late ConfigProvider provider ;
  @override
  Widget build(BuildContext context) {
    provider=Provider.of<ConfigProvider>(context);
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200.h,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30.r),
            ),
          ),
          child: Padding(
            padding: REdgeInsets.only(
              top: 50,
              left: 15,
              right: 15,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.welcome_back,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: ColorsManager.light,
                          ),
                        ),
                        Text(
                          "John Safwat",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        if(theme==Icons.light_mode_outlined)
                          {provider.configTheme(ThemeMode.dark);
                            theme=Icons.dark_mode_outlined;}
                        else if(theme==Icons.dark_mode_outlined)
                          {
                            provider.configTheme(ThemeMode.light);
                            theme=Icons.light_mode_outlined;
                          }
                      },
                      icon: Icon(
                        theme,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if(language=="EN") {
                          provider.configLanguage(Locale("ar"));
                          language="AR";
                        } else if(language=="AR") {
                          provider.configLanguage(Locale("EN"));
                          language="EN";
                        }
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: ColorsManager.light,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.r,
                            ),
                          )),
                      icon: Text(
                        language,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 30,
                    ),
                    Text(
                      "Cairo , Egypt",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                CustomTabBar(
                  tabDesignDM: TabDesignDM(
                    selectedTabBG: ColorsManager.light,
                    unSelectedTabBG: ColorsManager.transparent,
                    selectedLabelColor: ColorsManager.blue,
                    unSelectedLabelColor: ColorsManager.light,
                    borderColor: ColorsManager.light,
                  ), tabs: ConstantManager.eventTabs,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Event(eventDM: ConstantManager.events[index]);
            },
            itemCount: ConstantManager.events.length,
          ),
        ),
      ],
    );
  }
}
