import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/presentation/models/button_of_events_dm.dart';
import 'package:evently_project/presentation/models/category_d_m.dart';
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
      text: "Exception",
      image: AssetsManager.bosla,
    ),
    ButtonOfEventsDM(
      text: "meeting",
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
      text: "Exception",
      image: AssetsManager.bosla,
    ),
    ButtonOfEventsDM(
      text: "meeting",
      image: AssetsManager.bosla,
    ),
  ];
  static List<CategoryDM> categoriesWithOutAll = [
    CategoryDM(
      image: AssetsManager.sport,
      backGroundOfDateContainer: ColorsManager.light,
      favorite: AssetsManager.heartIcon,
      id: 1,
      bgImage: AssetsManager.sport,
    ),
    CategoryDM(
      image: AssetsManager.birthday,
      backGroundOfDateContainer: ColorsManager.light,
      favorite: AssetsManager.heartIcon,
      id: 2,
      bgImage: AssetsManager.birthday,
    ),
    CategoryDM(
      image: AssetsManager.exception,
      backGroundOfDateContainer: ColorsManager.light,
      favorite: AssetsManager.heartIcon,
      id: 3,
      bgImage: AssetsManager.exception,
    ),
    CategoryDM(
      image: AssetsManager.meeting,
      backGroundOfDateContainer: ColorsManager.light,
      favorite: AssetsManager.heartIcon,
      id: 4,
      bgImage: AssetsManager.meeting,
    ),
  ];

  static List<CategoryDM> categories = [
    CategoryDM(
      image: AssetsManager.sport,
      backGroundOfDateContainer: ColorsManager.light,
      favorite: AssetsManager.heartIcon,
      id: 0,
      bgImage: AssetsManager.sport,
    ),
    CategoryDM(
      image: AssetsManager.sport,
      backGroundOfDateContainer: ColorsManager.light,
      favorite: AssetsManager.heartIcon,
      id: 1,
      bgImage: AssetsManager.sport,
    ),
    CategoryDM(
      image: AssetsManager.sport,
      backGroundOfDateContainer: ColorsManager.light,
      favorite: AssetsManager.heartIcon,
      id: 2,
      bgImage: AssetsManager.sport,
    ),
    CategoryDM(
      image: AssetsManager.birthday,
      backGroundOfDateContainer: ColorsManager.light,
      favorite: AssetsManager.heartIcon,
      id: 3,
      bgImage: AssetsManager.birthday,
    ),
    CategoryDM(
      image: AssetsManager.exception,
      backGroundOfDateContainer: ColorsManager.light,
      favorite: AssetsManager.heartIcon,
      id: 4,
      bgImage: AssetsManager.exception,
    ),
    CategoryDM(
      image: AssetsManager.meeting,
      backGroundOfDateContainer: ColorsManager.light,
      favorite: AssetsManager.heartIcon,
      id: 5,
      bgImage: AssetsManager.meeting,
    ),
  ];
  static List<EventDM> favoriteEvents = [];
}
