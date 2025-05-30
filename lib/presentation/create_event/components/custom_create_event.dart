import 'package:evently_project/core/resources/assets_manager.dart';
import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/presentation/components/buildElevatedButton.dart';
import 'package:evently_project/presentation/components/buildEventDateAndTime.dart';
import 'package:evently_project/presentation/components/build_text_fields.dart';
import 'package:evently_project/presentation/models/buildEventDateAndTimeDM.dart';
import 'package:evently_project/presentation/models/tab_design_dm.dart';
import 'package:evently_project/presentation/models/text_field_dm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/constant_manager.dart';
import '../../components/button_of_events.dart';
import '../../components/custom_tab_bar.dart';
import '../../models/button_of_events_dm.dart';

class CustomCreateEvent extends StatefulWidget {
  const CustomCreateEvent({super.key, required this.image});
  final String image;

  @override
  State<CustomCreateEvent> createState() => _CustomCreateEventState();
}

class _CustomCreateEventState extends State<CustomCreateEvent> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              16,
            ),
            child: Image.asset(AssetsManager.sport),
          ),
          CustomTabBar(
            tabDesignDM: TabDesignDM(
              selectedTabBG: ColorsManager.blue,
              unSelectedTabBG: ColorsManager.light,
              selectedLabelColor: ColorsManager.light,
              unSelectedLabelColor: ColorsManager.blue,
              borderColor: ColorsManager.blue,
            ),
            tabs: ConstantManager.eventTabsWithOutAll,
          ),
          Text(
            "Title",
            style: GoogleFonts.inter(
              color: ColorsManager.dark,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          BuildTextFields(
            textFieldDM: TextFieldDM(
              prefixIcon: Icon(
                Icons.edit_note_sharp,
              ),
              suffixIcon: null,
              hintText: 'Event Title',
              obsecureText: false,
              heightOfTextField: null,
            ),
          ),
          Text(
            "Description",
            style: GoogleFonts.inter(
              color: ColorsManager.dark,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          BuildTextFields(
            textFieldDM: TextFieldDM(
              prefixIcon: null,
              suffixIcon: null,
              hintText: '  Event Description',
              obsecureText: false, heightOfTextField: null,
            ),
          ),
          BuildEventDateAndTime(
            buildEventDateAndTimeDM: BuildEventDateAndTimeDM(
              icon: Icon(
                Icons.calendar_month_outlined,
              ),
              nameOfChosenEvent: "Choose Date",
              nameOfEvent: "Event Date",
            ),
          ),
          BuildEventDateAndTime(
            buildEventDateAndTimeDM: BuildEventDateAndTimeDM(
              icon: Icon(
                Icons.watch_later_outlined,
              ),
              nameOfChosenEvent: "Choose Time",
              nameOfEvent: "Event Time",
            ),
          ),
          Text(
            "Location",
            style: GoogleFonts.inter(
              color: ColorsManager.dark,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          BuildTextFields(
            textFieldDM: TextFieldDM(
              prefixIcon: Icon(
                Icons.my_location_outlined,
                color: ColorsManager.grey,
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.arrow_forward_ios_outlined,color: ColorsManager.grey,),
                onPressed: () {},
              ),
              hintText: "Choose Event Location",
              obsecureText: false,
              heightOfTextField: null,
            ),
          ),
          BuildElevatedButton(nameOfButton: "Add Event", onClicked:(){
          }, backGroundColor: ColorsManager.blue,)
        ],
      ),
    );
  }
}
