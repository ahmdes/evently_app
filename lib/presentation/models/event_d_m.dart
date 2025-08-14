import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_project/core/resources/constant_manager.dart';
import 'package:evently_project/presentation/models/category_d_m.dart';

class EventDM {
  String title, description, bgImage;
  DateTime dateTime;
  CategoryDM category;
  String? id;
  String uId;
  double latitude, longitude;
  EventDM({
    this.id = "",
    required this.uId,
    required this.description,
    required this.title,
    required this.dateTime,
    required this.category,
    required this.bgImage,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "dateTime": dateTime,
        "categoryId": category.id,
        "bgImage": bgImage,
        "uId": uId,
        "latitude": latitude,
        "longitude": longitude
      };

  EventDM.fromJson(Map<String, dynamic> json)
      : this(
            bgImage: json['bgImage'],
            id: json['id'],
            title: json['title'],
            description: json["description"],
            dateTime: (json["dateTime"] as Timestamp).toDate(),
            category: ConstantManager.categories
                .firstWhere((category) => category.id == json["categoryId"]),
            uId: json["uId"],
            latitude: json["latitude"],
            longitude: json["longitude"]);
}
