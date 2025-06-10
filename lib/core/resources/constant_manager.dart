import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/presentation/models/button_of_events_dm.dart';
import 'package:evently_project/presentation/models/event_d_m.dart';
import 'package:evently_project/presentation/on_boarding/models/on_boarding_dm.dart';
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
  static List<OnBoardingDM> onBoardingInfo = [
    OnBoardingDM(
      image: AssetsManager.cat,
      title: "Find Events That Inspire You",
      subject:
          "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
    ),
    OnBoardingDM(
      image: AssetsManager.search,
      title: "Effortless Event Planning",
      subject:
          " Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
    ),
    OnBoardingDM(
      image: AssetsManager.social,
      title: "Connect with Friends & Share Moments",
      subject:
          "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
    ),
  ];
}
