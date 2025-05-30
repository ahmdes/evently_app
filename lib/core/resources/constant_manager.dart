import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/presentation/models/button_of_events_dm.dart';
import 'package:evently_project/presentation/models/event_d_m.dart';
import 'assets_manager.dart';

class ConstantManager {
  static List<ButtonOfEventsDM> eventTabs = [
    ButtonOfEventsDM(
      text: "All",
      image: AssetsManager.bosla,
    ),
    ButtonOfEventsDM(
      text: "Sport",
      image: AssetsManager.bike,
    ),
    ButtonOfEventsDM(
      text: "Birthday",
      image: AssetsManager.birthdayIcon,
    ),
    ButtonOfEventsDM(
      text: "Eating",
      image: AssetsManager.bosla,
    ),
    ButtonOfEventsDM(
      text: "Holiday",
      image: AssetsManager.bosla,
    ),
  ];

  static List<ButtonOfEventsDM> eventTabsWithOutAll = [
    ButtonOfEventsDM(
      text: "Sport",
      image: AssetsManager.bike,
    ),
    ButtonOfEventsDM(
      text: "Birthday",
      image: AssetsManager.birthdayIcon,
    ),
    ButtonOfEventsDM(
      text: "Eating",
      image: AssetsManager.bosla,
    ),
    ButtonOfEventsDM(
      text: "Holiday",
      image: AssetsManager.bosla,
    ),
  ];

  static List<EventDM> events = [
    EventDM(
      image: AssetsManager.birthday,
      eventName: "This is a Birthday Party",
      backGroundOfDateContainer: ColorsManager.light,
      favorite: AssetsManager.heartIcon,
    ),
    EventDM(
      image: AssetsManager.sport,
      eventName: "This is a Football match",
      backGroundOfDateContainer: ColorsManager.light,
      favorite: AssetsManager.heartIcon,
    ),
    EventDM(
      image: AssetsManager.exception,
      eventName: "Meeting for Updating The Development Method",
      backGroundOfDateContainer: ColorsManager.light,
      favorite: AssetsManager.heartIcon,
    ),
    EventDM(
      image: AssetsManager.meeting,
      eventName: "Meeting for Updating The Development Method",
      backGroundOfDateContainer: ColorsManager.light,
      favorite: AssetsManager.heartIcon,
    ),
  ];

  static List<EventDM> favoriteEvents = [];
}
