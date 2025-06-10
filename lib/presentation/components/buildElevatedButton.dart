import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/resources/colors_manager.dart';

class BuildElevatedButton extends StatelessWidget {
  const BuildElevatedButton({
    super.key,
    required this.nameOfButton,
    required this.onClicked,
  });
  final VoidCallback onClicked;
  final String nameOfButton;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      child: Text(
        nameOfButton,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
