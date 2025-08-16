import 'package:evently_project/Provider/config_provider.dart';
import 'package:evently_project/core/resources/assets_manager.dart';
import 'package:evently_project/presentation/components/buildElevatedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/routes/routes_manager.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ConfigProvider configProvider;
  @override
  Widget build(BuildContext context) {
    configProvider = Provider.of<ConfigProvider>(context);
    String dropDownValueLanguage =
        configProvider.currentLanguage == Locale("ar")
            ? AppLocalizations.of(context)!.arabic
            : "English";
    String dropDownValueTheme = configProvider.currentTheme == ThemeMode.light
        ? AppLocalizations.of(context)!.light
        : AppLocalizations.of(context)!.dark;
    List<DropdownMenuItem<String>> itemsOfLanguage = [
      DropdownMenuItem(
        value: AppLocalizations.of(context)!.arabic,
        child: Text(
          AppLocalizations.of(context)!.arabic,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      DropdownMenuItem(
        value: "English",
        child: Text(
          "English",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    ];
    List<DropdownMenuItem<String>> itemsOfTheme = [
      DropdownMenuItem(
        value: AppLocalizations.of(context)!.light,
        child: Text(
          AppLocalizations.of(context)!.light,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      DropdownMenuItem(
        value: AppLocalizations.of(context)!.dark,
        child: Text(
          AppLocalizations.of(context)!.dark,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    ];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorsManager.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  64.r,
                ),
              ),
            ),
            child: Padding(
              padding: REdgeInsets.only(
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        24.r,
                      ),
                      topRight: Radius.circular(
                        1000.r,
                      ),
                      bottomRight: Radius.circular(
                        1000.r,
                      ),
                      bottomLeft: Radius.circular(
                        1000.r,
                      ),
                    ),
                    child: SizedBox(
                        height: 120.h,
                        width: 120.w,
                        child: Image.asset(AssetsManager.personProfileIMage)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        configProvider.currentUser!.name,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 24.sp,
                          color: ColorsManager.light,
                        ),
                      ),
                      Text(
                        configProvider.currentUser!.email,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: ColorsManager.light,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: REdgeInsets.all(20),
            child: SizedBox(
              height: 220.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.dark,
                    ),
                  ),
                  buildDropdownButtonFormField(
                    itemsOfLanguage,
                    dropDownValueLanguage,
                    onLanguageChanged,
                  ),
                  Text(
                    AppLocalizations.of(context)!.theme,
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.dark,
                    ),
                  ),
                  buildDropdownButtonFormField(
                    itemsOfTheme,
                    dropDownValueTheme,
                    onThemeChanged,
                  ),
                ],
              ),
            ),
          ),
          Spacer(
            flex: 8,
          ),
          Padding(
            padding: REdgeInsets.all(20.0),
            child: BuildElevatedButton(
              nameOfButton: AppLocalizations.of(context)!.logout,
              onClicked: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          backgroundColor: ColorsManager.grey,
                          content: Text(
                            AppLocalizations.of(context)!.sure_of_log_out,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                FirebaseAuth.instance.signOut();
                                configProvider.currentUser = null;
                                Navigator.pop(context);
                                Navigator.pushNamed(
                                    context, RoutesManager.signIn);
                              },
                              child: Text(
                                AppLocalizations.of(context)!.ok,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                AppLocalizations.of(context)!.cancel,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                          ],
                        ));
              },
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  void onThemeChanged(String? newTheme) {
    configProvider.configTheme(newTheme == AppLocalizations.of(context)!.light
        ? ThemeMode.light
        : ThemeMode.dark);
  }

  void onLanguageChanged(String? newLang) {
    configProvider.configLanguage(
        newLang == AppLocalizations.of(context)!.arabic
            ? Locale("ar")
            : Locale("en"));
  }

  DropdownButtonFormField<String> buildDropdownButtonFormField(
    List<DropdownMenuItem<String>> items,
    String value,
    void Function(String?) onClicked,
  ) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            16,
          ),
          borderSide: BorderSide(
            color: ColorsManager.blue,
            width: 2,
          ),
        ),
      ),
      borderRadius: BorderRadius.circular(16.r),
      value: value,
      isExpanded: true,
      icon: Icon(
        Icons.arrow_drop_down,
      ),
      onChanged: onClicked,
      items: items,
    );
  }
}
