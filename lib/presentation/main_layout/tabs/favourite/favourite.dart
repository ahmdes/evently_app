import 'package:evently_project/presentation/components/build_text_fields.dart';
import 'package:evently_project/presentation/models/text_field_dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../Provider/config_provider.dart';
import '../../../components/category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});
  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  late ConfigProvider configProvider;
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String searchKey = "";
  @override
  Widget build(BuildContext context) {
    configProvider = Provider.of<ConfigProvider>(context);
    return Padding(
      padding: REdgeInsets.only(
        top: 50,
      ),
      child: Column(
        children: [
          Padding(
            padding: REdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: BuildTextFields(
              textFieldDM: TextFieldDM(
                prefixIcon: Icon(Icons.search),
                suffixIcon: null,
                hintText: AppLocalizations.of(context)!.search_for_event,
                obsecureText: false,
                heightOfTextField: null,
                onChanged: (input) {
                  getFavoriteEventsBySearchKey(input);
                },
              ),
            ),
          ),
          (configProvider.favoriteEvents.isEmpty)
              ? Text(
                  AppLocalizations.of(context)!.no_favorite_events,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                )
              : Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Category(
                        eventDM: configProvider.favoriteEvents[index],
                        isFavorite: configProvider.currentUser!.favoriteEvents
                            .contains(configProvider.favoriteEvents[index].id),
                      );
                    },
                    itemCount: configProvider.favoriteEvents.length,
                  ),
                ),
        ],
      ),
    );
  }

  void getFavoriteEventsBySearchKey(String searchKey) {
    if (searchKey.trim().isEmpty) {
      configProvider.favoriteEvents = configProvider.favoriteEvents;
    } else {
      configProvider.favoriteEvents = configProvider.favoriteEvents
          .where(
            (event) =>
                event.title.toLowerCase().contains(searchKey.toLowerCase()) ||
                event.description.toLowerCase().contains(
                      searchKey.toLowerCase(),
                    ),
          )
          .toList();
    }
    setState(() {});
  }
}
