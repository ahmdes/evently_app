import 'package:flutter/material.dart';

import '../../../../core/resources/colors_manager.dart';
class Love extends StatelessWidget {
  const Love({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.light,
      ),
      child: Center(
        child: Text(
          "Love",
        ),
      ),
    );
  }
}
