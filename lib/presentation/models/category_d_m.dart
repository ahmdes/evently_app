import 'dart:ui';
import 'package:flutter/cupertino.dart';

class CategoryDM {
  String image, favorite, bgImage;
  int id;
  Color backGroundOfDateContainer;
  CategoryDM(
      {required this.image,
      required this.backGroundOfDateContainer,
      required this.favorite,
      required this.bgImage,
      required this.id});
}
