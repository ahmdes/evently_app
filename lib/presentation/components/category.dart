import 'package:evently_project/Provider/config_provider.dart';
import 'package:evently_project/core/extensions/date.dart';
import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/firebase_service/firebase_service.dart';
import 'package:evently_project/presentation/event_details/event_details.dart';
import 'package:evently_project/presentation/models/event_d_m.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Category extends StatefulWidget {
  const Category({super.key, required this.eventDM, required this.isFavorite});
  final EventDM eventDM;
  final bool isFavorite;
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  DateTime dateTime = DateTime.now();
  late bool favoriteOrNot;
  late ConfigProvider provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     favoriteOrNot = widget.isFavorite;
  }
  @override
  Widget build(BuildContext context) {
    ConfigProvider provider = Provider.of<ConfigProvider>(context);
    return InkWell(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetails(
              eventDM: widget.eventDM,
            ),
          ),
        );
        setState(() {});
      },
      child: Padding(
        padding: REdgeInsets.only(
          top: 8.0,
          right: 8,
          left: 8,
        ),
        child: Container(
          width: 361.w,
          height: 230.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(16.r),
              ),
              image: DecorationImage(
                image: AssetImage(
                  widget.eventDM.bgImage,
                ),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: ColorsManager.blue,
                width: 2.w,
              )),
          child: Stack(
            children: [
              Positioned(
                left: 15.w,
                top: 170.h,
                child: Container(
                  height: 40.h,
                  width: 350.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                    color: Theme.of(context).primaryColorLight,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          widget.eventDM.description,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          if (favoriteOrNot) {
                            await FirebaseService.deleteEventsFromFavorite(
                                context, widget.eventDM.id!);
                            favoriteOrNot = false;
                          } else {
                            await FirebaseService.addEventsToFavorite(
                                context, widget.eventDM.id!);
                            favoriteOrNot = true;
                          }
                          provider.getFavoriteUpdates(context);
                          setState(() {});
                        },
                        icon: Icon(
                           favoriteOrNot
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: ColorsManager.blue,

                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 10.w,
                top: 8.h,
                child: Container(
                  width: 60.w,
                  height: 62.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Theme.of(context).primaryColorLight,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          widget.eventDM.dateTime.day.toString(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          widget.eventDM.dateTime.getDateFormatFromDateTime,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
