import 'package:evently_project/Provider/config_provider.dart';
import 'package:evently_project/core/extensions/date.dart';
import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/firebase_service/firebase_service.dart';
import 'package:evently_project/presentation/edit_event/edit_event.dart';
import 'package:evently_project/presentation/models/event_d_m.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class EventDetails extends StatefulWidget {
  const EventDetails({super.key, required this.eventDM});
  final EventDM eventDM;

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  late ConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ConfigProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.event_details),
        actions: provider.currentUser?.id == widget.eventDM.uId
            ? [
                IconButton(
                  icon: Icon(
                    Icons.mode_edit_outline_outlined,
                    color: ColorsManager.blue,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditEvent(eventDM: widget.eventDM),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 5.w,
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: ColorsManager.lightRed,
                    size: 30,
                  ),
                  onPressed: () {
                    showDeletingDialog();
                  },
                ),
                SizedBox(
                  width: 8.w,
                ),
              ]
            : [],
      ),
      body: Padding(
        padding: REdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.asset(
                  widget.eventDM.bgImage,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                widget.eventDM.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: 60.h,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsManager.blue, width: 2.w),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: ColorsManager.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.calendar_month_outlined,
                          color: ColorsManager.light,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.eventDM.dateTime.eventDate,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            widget.eventDM.dateTime.eventTime,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: 60.h,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsManager.blue, width: 2.w),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: ColorsManager.blue,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Icon(
                          Icons.my_location,
                          color: ColorsManager.light,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        widget.eventDM.latitude.spMin
                            .toString(), //,${eventDM.longitude.toString()}
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: ColorsManager.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.w,
              ),
              Container(
                height: 361.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: ColorsManager.blue,
                    width: 2.w,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                          widget.eventDM.latitude, widget.eventDM.longitude),
                      zoom: 12.0,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId("1"),
                        position: LatLng(
                            widget.eventDM.latitude, widget.eventDM.longitude),
                      ),
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                AppLocalizations.of(context)!.description,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.eventDM.description,
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
        ),
      ),
    );
  }

  showDeletingDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: ColorsManager.grey,
              content: Text(
                AppLocalizations.of(context)!.sure_of_deleting_event,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    FirebaseService.deleteEvent(widget.eventDM);
                    Navigator.pop(context);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.ok,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.cancel,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ],
            ));
  }
}
