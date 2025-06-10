import 'dart:ui';

class TabDesignDM {
  Color selectedTabBG,
      unSelectedTabBG,
      borderColor;
  Color       ?selectedLabelColor,
  unSelectedLabelColor;
  TabDesignDM({
    required this.selectedTabBG,
    required this.unSelectedTabBG,
     this.selectedLabelColor,
     this.unSelectedLabelColor,
    required this.borderColor,
  });
}
