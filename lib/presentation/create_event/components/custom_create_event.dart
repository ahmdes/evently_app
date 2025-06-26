import 'package:evently_project/core/resources/assets_manager.dart';
import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/presentation/components/buildElevatedButton.dart';
import 'package:evently_project/presentation/components/buildEventDateAndTime.dart';
import 'package:evently_project/presentation/components/build_text_fields.dart';
import 'package:evently_project/presentation/models/buildEventDateAndTimeDM.dart';
import 'package:evently_project/presentation/models/tab_design_dm.dart';
import 'package:evently_project/presentation/models/text_field_dm.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/constant_manager.dart';
import '../../components/custom_tab_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              unSelectedTabBG: ColorsManager.transparent,
              selectedLabelColor: ColorsManager.light,
              unSelectedLabelColor: ColorsManager.blue,
              borderColor: ColorsManager.blue,
            ),
            tabs: ConstantManager.eventTabsWithOutAll,
          ),
          Text(
            AppLocalizations.of(context)!.title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          BuildTextFields(
            textFieldDM: TextFieldDM(
              prefixIcon: Icon(
                Icons.edit_note_sharp,
              ),
              suffixIcon: null,
              hintText: AppLocalizations.of(context)!.event_title,
              obsecureText: false,
              heightOfTextField: null,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.description,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          BuildTextFields(
            textFieldDM: TextFieldDM(
              prefixIcon: null,
              suffixIcon: null,
              hintText: AppLocalizations.of(context)!.event_description,
              obsecureText: false, heightOfTextField: null,
            ),
          ),
          BuildEventDateAndTime(
            buildEventDateAndTimeDM: BuildEventDateAndTimeDM(
              icon: Icon(
                Icons.calendar_month_outlined,
              ),
              nameOfChosenEvent: AppLocalizations.of(context)!.choose_date,
              nameOfEvent: AppLocalizations.of(context)!.event_date,
            ),
          ),
          BuildEventDateAndTime(
            buildEventDateAndTimeDM: BuildEventDateAndTimeDM(
              icon: Icon(
                Icons.watch_later_outlined,
              ),
              nameOfChosenEvent: AppLocalizations.of(context)!.choose_time,
              nameOfEvent: AppLocalizations.of(context)!.event_time,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.location,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          BuildTextFields(
            textFieldDM: TextFieldDM(
              prefixIcon: Icon(
                Icons.my_location_outlined,
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.arrow_forward_ios_outlined,),
                onPressed: () {},
              ),
              hintText: AppLocalizations.of(context)!.choose_event_location,
              obsecureText: false,
              heightOfTextField: null,
            ),
          ),
          BuildElevatedButton(nameOfButton: AppLocalizations.of(context)!.add_event, onClicked:(){
          },)
        ],
      ),
    );
  }
}
