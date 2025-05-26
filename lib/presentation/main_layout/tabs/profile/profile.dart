import 'package:flutter/material.dart';

import '../../../../core/resources/colors_manager.dart';
class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.light,
      ),
      child: Center(
        child: Text(
          "Profile",
        ),
      ),
    );
  }
}
