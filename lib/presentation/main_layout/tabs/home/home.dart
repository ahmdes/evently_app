import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/core/resources/constant_manager.dart';
import 'package:evently_project/presentation/components/button_of_events.dart';
import 'package:evently_project/presentation/components/event.dart';
import 'package:evently_project/presentation/models/button_of_events_dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200.h,
          decoration: BoxDecoration(
            color: ColorsManager.blue,
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
                          "Welcome Back ✨",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: ColorsManager.light,
                          ),
                        ),
                        Text(
                          "John Safwat",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 24.sp,
                            color: ColorsManager.light,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.light_mode_outlined,
                        size: 30,
                        color: ColorsManager.light,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                          backgroundColor: ColorsManager.light,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.r,
                            ),
                          )),
                      icon: Text(
                        "EN",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: ColorsManager.light,
                      size: 30,
                    ),
                    Text(
                      "Cairo , Egypt",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        color: ColorsManager.light,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                DefaultTabController(
                  length:ConstantManager.eventTabs.length,
                  child: TabBar(
                    onTap: (index) {
                      selectedTabIndex = index;
                      setState(() {});
                    },
                    isScrollable: true,
                    splashBorderRadius: BorderRadius.circular(10),
                    tabs: [
                      for (int i = 0; i < ConstantManager.eventTabs.length; i++)
                        Tab(
                          child: ButtonOfEvents(
                            buttonOfEventsDM: ButtonOfEventsDM(
                              text: ConstantManager.eventTabs[i].text,
                              image: ConstantManager.eventTabs[i].image,
                            ),
                            isSelected: selectedTabIndex == i,
                          ),
                        ),
                    ],

                  ),
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
