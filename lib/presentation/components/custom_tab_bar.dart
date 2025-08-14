import 'package:evently_project/presentation/models/category_d_m.dart';
import 'package:evently_project/presentation/models/tab_design_dm.dart';
import 'package:flutter/material.dart';
import '../models/button_of_events_dm.dart';
import 'button_of_events.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar(
      {super.key,
      required this.tabDesignDM,
      required this.tabs,
      required this.categories,required this.categoryId});
  final TabDesignDM tabDesignDM;
  final List<ButtonOfEventsDM> tabs;
  final List<CategoryDM> categories;
  final   int categoryId;
  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  void initState() {
    // TODO: implement initState
     selectedIndex = widget.categoryId;
  }
  int ?selectedIndex;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabs.length,
      child: TabBar(
        // unselectedLabelColor: widget.tabDesignDM.unSelectedLabelColor,
        // labelColor: widget.tabDesignDM.selectedLabelColor,
        onTap: (index) {
          widget.tabDesignDM.onCategoryTabClicked(widget.categories[index]);
          selectedIndex = index;
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
                isSelected: selectedIndex == i,
                tabDesignDM: widget.tabDesignDM,
              ),
            ),
        ],
      ),
    );
  }
}
