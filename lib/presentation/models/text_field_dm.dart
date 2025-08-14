import 'package:flutter/material.dart';

class TextFieldDM {
  Icon? prefixIcon;
  IconButton? suffixIcon;
  String hintText;
  bool obsecureText;
  double? heightOfTextField;
  TextEditingController? controller;
  String? Function(String?)? validate;
  void Function(String)? onChanged;
  TextFieldDM({
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
    required this.obsecureText,
    required this.heightOfTextField,
    this.controller,
    this.validate,
    this.onChanged
  });
}
