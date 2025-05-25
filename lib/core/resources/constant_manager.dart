import 'package:evently_project/presentation/models/button_of_events_dm.dart';

import '../../presentation/components/button_of_events.dart';
import 'assets_manager.dart';

class ConstantManager {
  static List<ButtonOfEventsDM> eventsButtons = [
    ButtonOfEventsDM(
      text: "All",
      image: AssetsManager.bosla,
    ),
    ButtonOfEventsDM(
      text: "Sport",
      image: AssetsManager.bosla,
    ),
    ButtonOfEventsDM(
      text: "Birthday",
      image: AssetsManager.bosla,
    ),
    ButtonOfEventsDM(
      text: "All",
      image: AssetsManager.bosla,
    ),
    ButtonOfEventsDM(
      text: "All",
      image: AssetsManager.bosla,
    ),
  ];
}
