import 'dart:ui';
import 'package:evently_project/presentation/models/category_d_m.dart';
import 'package:flutter/material.dart';

class TabDesignDM {
  Color selectedTabBG, unSelectedTabBG, borderColor;
  Color? selectedLabelColor, unSelectedLabelColor;
  void Function(CategoryDM) onCategoryTabClicked;
  TabDesignDM({
    required this.selectedTabBG,
    required this.unSelectedTabBG,
    this.selectedLabelColor,
    this.unSelectedLabelColor,
    required this.borderColor,
    required this.onCategoryTabClicked,
  });
}
