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

  static List<EventDM> events = [
    EventDM(
      image: AssetsManager.birthday,
      eventName: "This is a Birthday Party",
      day: '21',
      month: 'Nov',
      backGroundOfDateContainer: ColorsManager.light,
      favorite: AssetsManager.heartIcon,
    ),
    EventDM(
      image: AssetsManager.sport,
      eventName: "This is a Football match",
      day: '22',
      month: 'Nov',
      backGroundOfDateContainer: ColorsManager.light,
      favorite: AssetsManager.heartIcon,
    ),
    EventDM(
      image: AssetsManager.exception,
      eventName: "This is an exception Party",
      day: '23',
      month: 'Nov',
      backGroundOfDateContainer: ColorsManager.light,
      favorite: AssetsManager.heartIcon,
    ),
    EventDM(
      image: AssetsManager.meeting,
      eventName: "Meeting for Updating The Development",
      day: '24',
      month: 'Nov',
      backGroundOfDateContainer: ColorsManager.light,
      favorite: AssetsManager.heartIcon,
    ),
  ];

  static List<EventDM> favoriteEvents = [];
}
