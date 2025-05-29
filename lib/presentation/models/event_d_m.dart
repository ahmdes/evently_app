import 'dart:ui';
class EventDM{
  String image,eventName,favorite;
  DateTime dateTime=DateTime.now();
  Color backGroundOfDateContainer;
  EventDM({required this.backGroundOfDateContainer,required this.favorite,required this.image,required this.eventName});
}