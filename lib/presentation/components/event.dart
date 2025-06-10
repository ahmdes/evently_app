import 'package:evently_project/core/extensions/date.dart';
import 'package:evently_project/core/resources/assets_manager.dart';
import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/core/resources/constant_manager.dart';
import 'package:evently_project/presentation/models/event_d_m.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Event extends StatefulWidget {
  const Event({super.key, required this.eventDM});
  final EventDM eventDM;
  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  String clickedFavorite = AssetsManager.filledColorHeart;

  String clickedUnFavorite = AssetsManager.heartIcon;

  Color colorOfUnFavoriteDate = ColorsManager.light;

  Color colorOfFavoriteDate = ColorsManager.lightBlue;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              widget.eventDM.image,
            ),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: ColorsManager.blue,
            width: 2.w,
          )
        ),
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
                    SizedBox(width: 10,),
                    Expanded(
                      flex: 4,
                      child: Text(
                        widget.eventDM.eventName,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          if (widget.eventDM.favorite == clickedFavorite) {
                            widget.eventDM.favorite = clickedUnFavorite;
                            widget.eventDM.backGroundOfDateContainer =
                                colorOfUnFavoriteDate;
                            ConstantManager.favoriteEvents.remove(widget.eventDM);
                          } else if (widget.eventDM.favorite ==
                              clickedUnFavorite) {
                            widget.eventDM.favorite = clickedFavorite;
                            widget.eventDM.backGroundOfDateContainer =
                                colorOfFavoriteDate;
                            ConstantManager.favoriteEvents.add(widget.eventDM);
                          }
                          setState(() {});
                        },
                        child: SizedBox(
                          child: Image.asset(
                            widget.eventDM.favorite,
                          ),
                        ),
                      ),
                    ),
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
    );
  }

}
