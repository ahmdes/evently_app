import 'package:flutter/material.dart';

class TextFieldDM {
  Icon prefixIcon;
  IconButton? suffixIcon;
  String hintText;
  bool obsecureText;
  TextFieldDM({
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
    required this.obsecureText,
  });
}
