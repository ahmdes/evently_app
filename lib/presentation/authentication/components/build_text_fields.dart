import 'package:evently_project/presentation/authentication/models/text_field_dm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/resources/colors_manager.dart';

class BuildTextFields extends StatelessWidget {
  const BuildTextFields({super.key,required this.textFieldDM});
  final TextFieldDM textFieldDM;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: textFieldDM.obsecureText,
      decoration: InputDecoration(
        prefixIcon: textFieldDM.prefixIcon,
        hintText: textFieldDM.hintText,
        suffixIcon: textFieldDM.suffixIcon,
        hintStyle: GoogleFonts.inter(),
      ),
    );
  }
}
