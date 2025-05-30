import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/core/routes/routes_manager.dart';
import 'package:evently_project/presentation/main_layout/tabs/home/home.dart';
import 'package:evently_project/presentation/main_layout/tabs/favourite/favourite.dart';
import 'package:evently_project/presentation/main_layout/tabs/map/map_location.dart';
import 'package:evently_project/presentation/main_layout/tabs/profile/profile.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> tabs = [
    Home(),
    MapLocation(),
    Favourite(),
    Profile(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutesManager.createEvent);
        },
        child: Icon(
          Icons.add_circle_outlined,
          color: ColorsManager.blue,
          size: 57,
        ),
      ),
      body: tabs[selectedIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (int currentIndex) {
        selectedIndex = currentIndex;
        setState(() {});
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          label: "Map",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.heart_broken_outlined),
          label: "Favourite",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}
