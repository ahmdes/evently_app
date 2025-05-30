import 'package:evently_project/presentation/models/tab_design_dm.dart';
import 'package:flutter/material.dart';
import '../../core/resources/constant_manager.dart';
import '../models/button_of_events_dm.dart';
import 'button_of_events.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key, required this.tabDesignDM,required this.tabs});
  final TabDesignDM tabDesignDM;
  final List<ButtonOfEventsDM>tabs;
  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: ConstantManager.eventTabs.length,
      child: TabBar(
        unselectedLabelColor: widget.tabDesignDM.unSelectedLabelColor,
        labelColor: widget.tabDesignDM.selectedLabelColor,
        onTap: (index) {
          selectedTabIndex = index;
          setState(() {});
        },
        isScrollable: true,
        splashBorderRadius: BorderRadius.circular(10),
        tabs: [
          for (int i = 0; i < widget.tabs.length; i++)
            Tab(
              child: ButtonOfEvents(
                buttonOfEventsDM: ButtonOfEventsDM(
                  text: widget.tabs[i].text,
                  image: widget.tabs[i].image,
                ),
                isSelected: selectedTabIndex == i,
                tabDesignDM: widget.tabDesignDM,
              ),
            ),
        ],
      ),
    );
  }
}
