import 'package:evently_project/Provider/config_provider.dart';
import 'package:evently_project/core/extensions/button_text_validation.dart';
import 'package:evently_project/core/extensions/date.dart';
import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/firebase_service/firebase_service.dart';
import 'package:evently_project/presentation/components/buildElevatedButton.dart';
import 'package:evently_project/presentation/components/buildEventDateAndTime.dart';
import 'package:evently_project/presentation/components/build_text_fields.dart';
import 'package:evently_project/presentation/create_event/select_location.dart';
import 'package:evently_project/presentation/models/buildEventDateAndTimeDM.dart';
import 'package:evently_project/presentation/models/event_d_m.dart';
import 'package:evently_project/presentation/models/tab_design_dm.dart';
import 'package:evently_project/presentation/models/text_field_dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/resources/constant_manager.dart';
import '../../components/custom_tab_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/category_d_m.dart';

class CustomEditEvent extends StatefulWidget {
  const CustomEditEvent({super.key, required this.eventDM});
  final EventDM eventDM;

  @override
  State<CustomEditEvent> createState() => _CustomCreateEventState();
}

class _CustomCreateEventState extends State<CustomEditEvent> {
  late String currentImage;
  int selectedIndex = 0;
  late TextEditingController titleController, descriptionController;
  late CategoryDM selectedCategory = ConstantManager.categoriesWithOutAll[0];
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  late ConfigProvider provider;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    initValues();
  }

  void initValues() {
    titleController.text = widget.eventDM.title;
    descriptionController.text = widget.eventDM.description;
    selectedDate = widget.eventDM.dateTime;
    currentImage = widget.eventDM.bgImage;
  }

  @override
  void dispose() {
    // TODO: implement distitleController.dispose();
    descriptionController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Padding(
      padding: REdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                16.r,
              ),
              child: Image.asset(currentImage),
            ),
            CustomTabBar(
              tabDesignDM: TabDesignDM(
                selectedTabBG: ColorsManager.blue,
                unSelectedTabBG: ColorsManager.transparent,
                selectedLabelColor: ColorsManager.light,
                unSelectedLabelColor: ColorsManager.blue,
                borderColor: ColorsManager.blue,
                onCategoryTabClicked: (selectedCategoryF) {
                  selectedCategory = ConstantManager
                      .categoriesWithOutAll[selectedCategoryF.id - 1];
                  currentImage = selectedCategory.bgImage;
                  setState(() {});
                },
              ),
              tabs: ConstantManager.eventTabsWithOutAll,
              categories: ConstantManager.categoriesWithOutAll, categoryId: widget.eventDM.category.id-1,
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
                  controller: titleController,
                  validate: (String? input) {
                    if (!ButtonTextValidation.isValidateString(input)) {
                      return AppLocalizations.of(context)!.plz_Enter_title;
                    }
                    return null;
                  }),
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
                  obsecureText: false,
                  heightOfTextField: null,
                  controller: descriptionController,
                  validate: (String? input) {
                    if (!ButtonTextValidation.isValidateString(input)) {
                      return AppLocalizations.of(context)!.plz_Enter_description;
                    }
                    if (!ButtonTextValidation.isCharsMoreThan6(input)) {
                      return AppLocalizations.of(context)!.description_letters;
                    }
                    return null;
                  }),
            ),
            BuildEventDateAndTime(
              buildEventDateAndTimeDM: BuildEventDateAndTimeDM(
                icon: Icon(
                  Icons.calendar_month_outlined,
                ),
                nameOfChosenEvent: AppLocalizations.of(context)!.choose_date,
                nameOfEvent: selectedDate.eventDate,
              ),
              onClicked: _showDate,
            ),
            BuildEventDateAndTime(
              buildEventDateAndTimeDM: BuildEventDateAndTimeDM(
                icon: Icon(
                  Icons.watch_later_outlined,
                ),
                nameOfChosenEvent: AppLocalizations.of(context)!.choose_time,
                nameOfEvent: selectedDate.eventTime,
              ),
              onClicked: _showTime,
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
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectLocation(),
                      ),
                    );
                  },
                ),
                hintText: AppLocalizations.of(context)!.choose_event_location,
                obsecureText: false,
                heightOfTextField: null,
              ),
            ),
            BuildElevatedButton(
              nameOfButton: AppLocalizations.of(context)!.update_event,
              onClicked: () async{
                if (!formKey.currentState!.validate()) return;
                try {
                  await FirebaseService.updateEvent(
                    EventDM(
                      id: widget.eventDM.id,
                      description: descriptionController.text,
                      title: titleController.text,
                      dateTime: selectedDate.copyWith(
                        hour: selectedTime.hour,
                        minute: selectedTime.minute,
                      ),
                      category: selectedCategory,
                      bgImage: currentImage,
                      uId: widget.eventDM.uId,
                      latitude: provider.currentLocation.latitude,
                      longitude: provider.currentLocation.longitude,
                    ),
                  );
                } catch (exception) {}
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _showDate() async {
    selectedDate = await showDatePicker(
            context: context,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 365))) ??
        selectedDate;
    setState(() {});
  }

  void _showTime() async {
    selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
            selectedTime;
    selectedDate = selectedDate.copyWith(
        hour: selectedTime.hour, minute: selectedTime.minute);
    setState(() {});
  }
}
